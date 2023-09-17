import '../../core/util/data_state.dart';
import '../../core/util/ui_constants.dart';
import '../../data/repository/remote_genre_list_repository.dart';
import '../entity/genre.dart';

class DisplayGenresList {
  final RemoteGenresListRepository repository;
  final Uri path = Uri.parse(
    '${UiConstants.baseUrl}genre/movie/list?api_key=${UiConstants.apiKey}',
  );

  DisplayGenresList({
    required this.repository,
  });

  Future<DataState<List<Genre>>> fetchGenres() async {
    return repository.fetchGenresList(
      path,
    );
  }
}
