import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/domain/entity/genres_list_state.dart';
import 'package:the_movie_db_app/src/presentation/bloc/custom_drawer_bloc.dart';
import 'package:the_movie_db_app/src/presentation/widget/custom_drawer/custom_drawer.dart';
import 'package:the_movie_db_app/src/presentation/widget/custom_inherited_widget.dart';

import '../../../../utils/material_app_wrapper.dart';

class MockCustomDrawerBloc extends CustomDrawerBloc {
  @override
  Future<void> getGenres() async {
    return null;
  }
}

void main() {
  testWidgets(
    'should find a stream<GenresListState>',
    (WidgetTester tester) async {
      GenresListState genresListState =
          GenresListState(state: DataStateStates.success);
      genresListState.genresList = [Genre.mockGenre(), Genre.mockGenre()];
      final mockBloc = MockCustomDrawerBloc();
      mockBloc.dataController.sink.add(genresListState);
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: CustomDrawer(customDrawerBloc: mockBloc),
        ),
      );
      emits(
        GenresListState,
      );
      expect(
        find.byType(StreamBuilder<GenresListState>),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'should find CustomInheritedWidget',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: CustomDrawer(
            customDrawerBloc: MockCustomDrawerBloc(),
          ),
        ),
      );
      expect(
        find.byType(CustomInheritedWidget),
        findsOneWidget,
      );
    },
  );
}
