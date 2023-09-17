import '../../core/util/data_state.dart';
import '../../domain/entity/movie.dart';
import 'remote_repository.dart';

class RemoteMoviesListRepository extends RemoteRepository<List<Movie>> {
  RemoteMoviesListRepository(super.client);

  Future<DataState<List<Movie>>> fetchMoviesList(Uri path) {
    return super.fetch(
      parseData,
      path,
    );
  }

  List<Movie> parseData(Map<String, dynamic> json) {
    return Movie.fromJsonList(
      json['results'],
    );
  }
}
