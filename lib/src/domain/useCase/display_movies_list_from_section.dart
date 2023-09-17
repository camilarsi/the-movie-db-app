import '../../core/util/data_state.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository/remote_movies_list_repository.dart';
import '../entity/movie.dart';

class DisplayMoviesListFromSection {
  DisplayMoviesListFromSection({required this.repository});

  final RemoteMoviesListRepository repository;

  Future<DataState<List<Movie>>> fetchMoviesList(String section) {
    final Uri path = Uri.parse(
        '${UiConstants.baseUrl}movie/$section?api_key=${UiConstants.apiKey}');
    return repository.fetchMoviesList(path);
  }
}
