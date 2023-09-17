import 'dart:async';

import '../../core/util/data_state.dart';
import '../../core/util/movie_section.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/genre.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movies_list_state.dart';
import '../../domain/useCase/display_movies_list_from_section.dart';
import '../../domain/useCase/display_movies_list_from_section_by_genre.dart';

class MoviesGridBloc {
  late final StreamController<MoviesListState> streamController;
  final MovieSection section;
  late final Genre? genre;
  final DisplayMoviesListFromSection displayMoviesListFromSection;
  late final DisplayMoviesListFromSectionByGenre? displayMoviesListByGenre;

  MoviesGridBloc({
    required this.displayMoviesListFromSection,
    required this.section,
    this.genre,
  }) {
    if (genre != null) {
      displayMoviesListByGenre = DisplayMoviesListFromSectionByGenre(
        displayMoviesListFromSection: displayMoviesListFromSection,
      );
    }
    streamController = StreamController.broadcast();
  }

  Stream<MoviesListState> get dataStream => streamController.stream;

  Future<void> getMovies() async {
    DataState<List<Movie>> moviesListDataState;
    if (genre != null) {
      moviesListDataState = await displayMoviesListByGenre!
          .fetchMoviesListByGenre(section.path, genre!);
    } else {
      moviesListDataState =
          await displayMoviesListFromSection.fetchMoviesList(section.path);
    }
    MoviesListState moviesListState = MoviesListState(
      state: moviesListDataState.state,
    );
    switch (moviesListState.state) {
      case DataStateStates.success:
        moviesListState.moviesList = moviesListDataState.data!;
        break;
      case DataStateStates.error:
        moviesListState.error =
            '${UiConstants.defaultFailMessage}: ${moviesListDataState.error}';
        break;
      default:
        moviesListState.error = UiConstants.emptyResponseMessage;
    }
    streamController.sink.add(moviesListState);
  }
}
