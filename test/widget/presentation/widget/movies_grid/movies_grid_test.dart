import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/domain/entity/movies_list_state.dart';
import 'package:the_movie_db_app/src/presentation/bloc/movies_grid_bloc.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/movies_grid.dart';

import '../../../../utils/material_app_wrapper.dart';

class MockMoviesGridBloc extends Mock implements MoviesGridBloc {
  @override
  late final StreamController<MoviesListState> streamController =
      StreamController();
  @override
  Stream<MoviesListState> get dataStream => streamController.stream;

  @override
  Future<void> getMovies() async {
    final moviesListState = MoviesListState(
      state: DataStateStates.success,
    );
    streamController.sink.add(moviesListState);
  }
}

void main() {
  testWidgets(
    '',
    (WidgetTester tester) async {
      final mockMoviesGridBloc = MockMoviesGridBloc();
      await mockNetworkImages(
        () async => tester.pumpWidget(
          MaterialAppWrapper(
            root: MoviesGrid(
              moviesBloc: mockMoviesGridBloc,
            ),
          ),
        ),
      );
      emits(MoviesListState);
    },
  );
}
