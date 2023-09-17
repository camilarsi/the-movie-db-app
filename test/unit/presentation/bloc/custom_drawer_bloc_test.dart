import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/domain/entity/genres_list_state.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_genres_list.dart';
import 'package:the_movie_db_app/src/presentation/bloc/custom_drawer_bloc.dart';

class MockDisplayGenreList extends Mock implements DisplayGenresList {}

void main() {
  group(
    'getMovies() test, should emit a stream<GenreListState>',
    () {
      test(
        'getMovies() test whit genre !=null',
        () async {
          MockDisplayGenreList mockDisplayGenreList = MockDisplayGenreList();
          DataState<List<Genre>> expectedDataState =
              DataState(state: DataStateStates.success);
          GenresListState expectedGenresList =
              GenresListState(state: expectedDataState.state);
          expectedGenresList.genresList = [
            Genre.mockGenre(),
            Genre.mockGenre(),
            Genre.mockGenre()
          ];
          when(() => mockDisplayGenreList.fetchGenres()).thenAnswer(
            (_) async => expectedDataState,
          );
          CustomDrawerBloc customDrawerBloc = CustomDrawerBloc();
          Stream<GenresListState> stream = customDrawerBloc.dataStream;
          customDrawerBloc.getGenres();
          expectLater(
            stream,
            emitsInOrder(
              [expectedGenresList],
            ),
          );
        },
      );
    },
  );
}
