import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/core/util/movie_section.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/entity/movies_list_state.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_movies_list_from_section.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_movies_list_from_section_by_genre.dart';
import 'package:the_movie_db_app/src/presentation/bloc/movies_grid_bloc.dart';

class MockDisplayMoviesListFromSection extends Mock
    implements DisplayMoviesListFromSection {}

class MockDisplayMoviesListByGenre extends Mock
    implements DisplayMoviesListFromSectionByGenre {}

void main() {
  setUpAll(() {
    registerFallbackValue(
      Genre.mockGenre(),
    );
  });

  test(
    'getMovies() test, case genre != null, should emit a stream<List<Movie> only filtered from section ',
    () {
      const section = MovieSection.nowPlaying;
      final mockDisplayMoviesListFromSection =
          MockDisplayMoviesListFromSection();
      MoviesGridBloc moviesGridBloc = MoviesGridBloc(
          displayMoviesListFromSection: mockDisplayMoviesListFromSection,
          section: section);
      DataState<List<Movie>> expected = DataState(
        state: DataStateStates.success,
        data: [
          Movie.mockMovie(),
          Movie.mockMovie(),
          Movie.mockMovie(),
        ],
      );
      MoviesListState expectedMovies = MoviesListState(state: expected.state);
      expectedMovies.moviesList = expected.data!;
      MockDisplayMoviesListByGenre mockDisplayMoviesListByGenre =
          MockDisplayMoviesListByGenre();
      when(() => mockDisplayMoviesListFromSection.fetchMoviesList(section.path))
          .thenAnswer(
        (_) async => Future.value(
          DataState(
            state: DataStateStates.success,
            data: [
              Movie.mockMovie(),
            ],
          ),
        ),
      );
      when(
        () => mockDisplayMoviesListByGenre.fetchMoviesListByGenre(
          any(),
          any(),
        ),
      ).thenAnswer(
        (_) async => expected,
      );
      Stream<MoviesListState> stream = moviesGridBloc.dataStream;
      moviesGridBloc.getMovies();
      expectLater(
        stream,
        emitsInOrder([expectedMovies]),
      );
      expectLater(
        expectedMovies.data,
        hasLength(3),
      );
    },
  );

  test(
    'getMovies() test, case genre == null, should emit a stream<List<Movie> filtered from section and Genre',
    () async {
      const section = MovieSection.nowPlaying;
      final mockDisplayMoviesFromListSection =
          MockDisplayMoviesListFromSection();
      MoviesGridBloc moviesGridBloc = MoviesGridBloc(
        section: section,
        displayMoviesListFromSection: mockDisplayMoviesFromListSection,
      );
      DataState<List<Movie>> expected = DataState(
        state: DataStateStates.success,
        data: [
          Movie.mockMovie(),
          Movie.mockMovie(),
          Movie.mockMovie(),
          Movie.mockMovie(),
        ],
      );
      MoviesListState expectedMovies = MoviesListState(
        state: expected.state,
      );
      expectedMovies.moviesList = expected.data!;
      when(
        () => mockDisplayMoviesFromListSection.fetchMoviesList(
          any(),
        ),
      ).thenAnswer((_) async => expected);
      Stream<MoviesListState> stream = moviesGridBloc.dataStream;
      moviesGridBloc.getMovies();
      expectLater(
        stream,
        emitsInOrder(
          [expectedMovies],
        ),
      );
      expectLater(
        expectedMovies.data,
        hasLength(4),
      );
    },
  );
}
