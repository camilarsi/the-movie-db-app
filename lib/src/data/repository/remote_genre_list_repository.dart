import '../../core/util/data_state.dart';
import '../../domain/entity/genre.dart';
import 'remote_repository.dart';

class RemoteGenresListRepository extends RemoteRepository<List<Genre>> {
  RemoteGenresListRepository(super.client);

  Future<DataState<List<Genre>>> fetchGenresList(Uri path) {
    return super.fetch(
      parseData,
      path,
    );
  }

  List<Genre> parseData(Map<String, dynamic> json) {
    return Genre.fromJsonList(
      json['genres'],
    );
  }
}
