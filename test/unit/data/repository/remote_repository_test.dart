import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/data/repository/remote_movies_list_repository.dart';
import 'package:the_movie_db_app/src/data/repository/remote_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';

class MockClient extends Mock implements Client {}

void main() {
  test(
    'fetch() test, should return a DataState<List<Movie>>',
    () async {
      MockClient mockClient = MockClient();
      RemoteRepository remoteRepository = RemoteMoviesListRepository(
        mockClient,
      );
      const movie = """{"results":[{
        "adult": false,
        "backdrop_path": "/oqP1qEZccq5AD9TVTIaO6IGUj7o.jpg",
        "genre_ids": [14, 28, 12],
        "id": 455476,
        "original_language": "en",
        "original_title": "Knights of the Zodiac",
        "overview":
        "When a headstrong street orphan, Seiya, in search of his abducted sister unwittingly taps into hidden powers, he discovers he might be the only person alive who can protect a reincarnated goddess, sent to watch over humanity. Can he let his past go and embrace his destiny to become a Knight of the Zodiac?",
        "popularity": 3963.447,
        "poster_path": "/qW4crfED8mpNDadSmMdi7ZDzhXF.jpg",
        "release_date": "2023-04-27",
        "title": "Knights of the Zodiac",
        "video": false,
        "vote_average": 6.5,
        "vote_count": 367
      }]}""";
      when(() => mockClient.get(Uri.base)).thenAnswer(
        (_) async => Response(movie, HttpStatus.ok),
      );
      expectLater(
        await remoteRepository.fetch(
          (Map<String, dynamic> json) => Movie.fromJsonList(
            json['results'],
          ),
          Uri.base,
        ),
        isInstanceOf<DataState<List<Movie>>>(),
      );
    },
  );
  test(
    'onError() test, should return a DataState with a state != success',
    () async {
      MockClient mockClient = MockClient();
      RemoteRepository remoteRepository = RemoteMoviesListRepository(
        mockClient,
      );
      Response response = Response(
        'mockBodyResponse',
        HttpStatus.badRequest,
      );
      DataState result = await remoteRepository.onError(
        response,
      );
      expectLater(
        result,
        isInstanceOf<DataState>(),
      );
      expectLater(result.error, 'Bad request');
    },
  );
  test(
    'Should return an error message',
    () async {
      MockClient mockClient = MockClient();
      RemoteRepository remoteRepository = RemoteMoviesListRepository(
        mockClient,
      );
      Response response = Response(
        'mockBodyResponse',
        HttpStatus.conflict,
      );
      DataState result = await remoteRepository.onError(
        response,
      );
      expectLater(
        result.error,
        'Oops! Something went wrong',
      );
    },
  );
}
