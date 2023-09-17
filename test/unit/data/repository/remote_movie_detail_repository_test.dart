import 'package:flutter_test/flutter_test.dart';
import 'package:http/src/client.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/core/util/ui_constants.dart';
import 'package:the_movie_db_app/src/data/repository/remote_movie_detail_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';

void main() {
  group(
    'fetchMovie() test, should return a DataState<Movie>',
    () {
      test(
        'fetchMovie() test',
        () async {
          int movieId = 926393;
          final path = Uri.parse(
              '${UiConstants.baseUrl}movie/$movieId?api_key=${UiConstants.apiKey}');

          RemoteMovieDetailRepository remoteMovieDetailRepository =
              RemoteMovieDetailRepository(
            Client(),
          );
          expectLater(
            await remoteMovieDetailRepository.fetchMovie(
              path,
            ),
            isInstanceOf<DataState<Movie>>(),
          );
        },
      );
    },
  );
  test(
    'parseData() test, should return a Movie',
    () async {
      Map<String, dynamic> jsonResponse = {
        'id': 926393,
        'original_title': "The Equalizer 3",
        'overview':
            "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
        'poster_path': "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
        'release_date': "2023-08-30",
        'title': "The Equalizer 3",
        'vote_average': 7.357,
        'genres': [
          {"id": 28, "name": "Action"},
          {"id": 53, "name": "Thriller"},
          {"id": 80, "name": "Crime"}
        ],
        'backdrop_path': "/cHNqobjzfLj88lpIYqkZpecwQEC.jpg",
      };
      RemoteMovieDetailRepository remoteMovieDetailRepository =
          RemoteMovieDetailRepository(
        Client(),
      );
      expect(
        remoteMovieDetailRepository.parseData(jsonResponse),
        equals(
          Movie.mockMovie(),
        ),
      );
    },
  );
}
