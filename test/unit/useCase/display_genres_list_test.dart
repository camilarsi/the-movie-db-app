import 'package:flutter_test/flutter_test.dart';
import 'package:http/src/client.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/data/repository/remote_genre_list_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_genres_list.dart';

void main() {
  test(
    'fetchGenres() test, should return a DataState<List<Genre>>',
    () async {
      final repository = RemoteGenresListRepository(
        Client(),
      );
      DisplayGenresList displayGenresList = DisplayGenresList(
        repository: repository,
      );
      final result = await displayGenresList.fetchGenres();
      expectLater(
        result,
        isA<DataState<List<Genre>>>(),
      );
      expect(
        result.data,
        contains(
          Genre.mockGenre(),
        ),
      );
    },
  );
}
