import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/domain/entity/movies_list_state.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/stream_builder_movies_list.dart';

import '../../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find a GridMoviesList',
    (WidgetTester tester) async {
      final streamController = StreamController<MoviesListState>();
      final moviesListState = MoviesListState(state: DataStateStates.success);
      streamController.sink.add(moviesListState);
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: StreamBuilderMoviesList(
            stream: streamController.stream,
          ),
        ),
      );
      emits(MoviesListState);
    },
  );
}
