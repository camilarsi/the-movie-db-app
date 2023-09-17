import '../../core/util/data_state.dart';
import '../entity/genre.dart';
import '../entity/movie.dart';
import 'display_movies_list_from_section.dart';

class DisplayMoviesListFromSectionByGenre {
  final DisplayMoviesListFromSection displayMoviesListFromSection;

  DisplayMoviesListFromSectionByGenre({
    required this.displayMoviesListFromSection,
  });

  Future<DataState<List<Movie>>> fetchMoviesListByGenre(
      String section, Genre genre) async {
    try {
      DataState moviesFromSection =
          await displayMoviesListFromSection.fetchMoviesList(section);
      List<Movie> moviesFromGenre = moviesFromSection.data
          .where((movie) => containsGenre(movie, genre))
          .toList();
      return DataState(
        state: DataStateStates.success,
        data: moviesFromGenre,
      );
    } catch (exception) {
      rethrow;
    }
  }

  bool containsGenre(Movie movie, Genre genre) {
    return movie.genreIds.contains(genre.id);
  }
}
