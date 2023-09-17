import 'package:flutter_test/flutter_test.dart';
import 'package:http/src/client.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/core/util/movie_section.dart';
import 'package:the_movie_db_app/src/core/util/ui_constants.dart';
import 'package:the_movie_db_app/src/data/repository/remote_movies_list_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';

void main() {
  final section = MovieSection.nowPlaying.path;
  final path = Uri.parse(
    '${UiConstants.baseUrl}movie/$section?api_key=${UiConstants.apiKey}',
  );
  test(
    'fetchMoviesList() test, should return a DataState<List<Movie>>',
    () async {
      RemoteMoviesListRepository remoteMoviesListRepository =
          RemoteMoviesListRepository(
        Client(),
      );
      expectLater(
        await remoteMoviesListRepository.fetchMoviesList(path),
        isInstanceOf<DataState<List<Movie>>>(),
      );
    },
  );
  test(
    'parseData() test, should return a List<Movie>',
    () {
      RemoteMoviesListRepository remoteMoviesListRepository =
          RemoteMoviesListRepository(
        Client(),
      );
      Map<String, dynamic> jsonResponse = {
        'results': [
          {
            'id': 926393,
            'original_title': "The Equalizer 3",
            'overview':
                "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
            'poster_path': "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
            'release_date': "2023-08-30",
            'title': "The Equalizer 3",
            'vote_average': 7.357,
            'genre_ids': [28, 53, 80],
            'backdrop_path': "/cHNqobjzfLj88lpIYqkZpecwQEC.jpg",
          },
        ],
      };
      expectLater(
        remoteMoviesListRepository.parseData(jsonResponse),
        isInstanceOf<List<Movie>>(),
      );
    },
  );
}
