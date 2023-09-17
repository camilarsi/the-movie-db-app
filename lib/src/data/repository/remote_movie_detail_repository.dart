import '../../core/util/data_state.dart';
import '../../domain/entity/movie.dart';
import 'remote_repository.dart';

class RemoteMovieDetailRepository extends RemoteRepository<Movie> {
  RemoteMovieDetailRepository(super.client);

  Movie parseData(Map<String, dynamic> json) {
    return Movie.fromMovieByIdJsonResult(json);
  }

  Future<DataState<Movie>> fetchMovie(Uri path) {
    return super.fetch(
      parseData,
      path,
    );
  }
}
