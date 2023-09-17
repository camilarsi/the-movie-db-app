import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/entity/movies_list_state.dart';

void main() {
  test(
    '==(Object other) test, ==(Object object) test,  different objects, same values should be true',
    () {
      List<Movie> moviesList = [Movie.mockMovie()];
      MoviesListState moviesListState1 = MoviesListState(
        state: DataStateStates.success,
      );
      moviesListState1.moviesList = moviesList;
      MoviesListState moviesListState2 = MoviesListState(
        state: DataStateStates.success,
      );
      moviesListState2.moviesList = moviesList;
      expect(
        moviesListState1 == moviesListState2,
        isTrue,
      );
    },
  );
  test(
    '==(Object other) test, two objects with different values should be false',
    () {
      List<Movie> moviesList = [Movie.mockMovie()];
      MoviesListState moviesListState1 = MoviesListState(
        state: DataStateStates.success,
      );
      List<Movie> emptyMoviesList = [];
      moviesListState1.moviesList = moviesList;
      MoviesListState moviesListState2 = MoviesListState(
        state: DataStateStates.error,
      );
      moviesListState2.moviesList = emptyMoviesList;
      expect(
        moviesListState1 == moviesListState2,
        isFalse,
      );
    },
  );
}
