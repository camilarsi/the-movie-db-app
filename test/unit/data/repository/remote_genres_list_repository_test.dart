import 'package:flutter_test/flutter_test.dart';
import 'package:http/src/client.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/core/util/ui_constants.dart';
import 'package:the_movie_db_app/src/data/repository/remote_genre_list_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';

void main() {
  test(
    'fetchGenresList() test, should return a DataState<List<Genre>>',
    () async {
      RemoteGenresListRepository remoteGenresListRepository =
          RemoteGenresListRepository(
        Client(),
      );
      final Uri path = Uri.parse(
        '${UiConstants.baseUrl}genre/movie/list?api_key=${UiConstants.apiKey}',
      );
      expectLater(
        await remoteGenresListRepository.fetchGenresList(path),
        isInstanceOf<DataState<List<Genre>>>(),
      );
    },
  );
  test(
    'parseData() test, should return a List<Genre>',
    () {
      RemoteGenresListRepository remoteGenresListRepository =
          RemoteGenresListRepository(
        Client(),
      );
      Map<String, dynamic> jsonResponse = {
        'genres': [
          {
            'id': -1,
            'name': 'mockGenreName',
          },
        ]
      };
      expect(
        remoteGenresListRepository.parseData(jsonResponse),
        isInstanceOf<List<Genre>>(),
      );
    },
  );
}
