import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/domain/entity/genres_list_state.dart';

void main() {
  test(
    '==(Object other) test, different objects, same values should be true',
    () {
      GenresListState mockGenresList1 = GenresListState(
        state: DataStateStates.success,
      );
      GenresListState mockGenresList2 = GenresListState(
        state: DataStateStates.success,
      );
      expect(
        mockGenresList1 == mockGenresList2,
        isTrue,
      );
    },
  );
  test(
    '==(Object other) test, two objects with different values should be false',
    () {
      GenresListState mockGenresList1 = GenresListState(
        state: DataStateStates.success,
      );
      GenresListState mockGenresList2 = GenresListState(
        state: DataStateStates.error,
      );
      expect(
        mockGenresList1 == mockGenresList2,
        isFalse,
      );
    },
  );
}
