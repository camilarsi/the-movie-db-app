import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/core/util/movie_section.dart';
import 'package:the_movie_db_app/src/data/repository/remote_movies_list_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_movies_list_from_section.dart';

void main() {
  test(
    'fetchMoviesList() test, should return a DataState>List<Movie>>',
    () async {
      final repository = RemoteMoviesListRepository(
        Client(),
      );
      final displayMoviesListFromCategory = DisplayMoviesListFromSection(
        repository: repository,
      );
      final result = await displayMoviesListFromCategory.fetchMoviesList(
        MovieSection.values[0].path,
      );
      expect(
        result,
        isInstanceOf<DataState<List<Movie>>>(),
      );
    },
  );
}
