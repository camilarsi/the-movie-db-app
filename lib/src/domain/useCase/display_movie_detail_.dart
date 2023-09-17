import '../../core/util/data_state.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository/remote_movie_detail_repository.dart';
import '../entity/movie.dart';

class DisplayMovieDetail {
  final RemoteMovieDetailRepository repository;
  DisplayMovieDetail({
    required this.repository,
  });

  Future<DataState<Movie>> fetchMovieDetail(int movieId) {
    final Uri path = Uri.parse(
      '${UiConstants.baseUrl}movie/$movieId?api_key=${UiConstants.apiKey}',
    );
    return repository.fetchMovie(path);
  }
}
