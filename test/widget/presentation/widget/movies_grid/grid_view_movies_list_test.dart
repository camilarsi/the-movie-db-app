import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/entity/movies_list_state.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/grid_view_item.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/grid_view_movies_list.dart';

import '../../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find a GridViewItem per MovieListDataState.data element',
    (WidgetTester tester) async {
      final moviesListState = MoviesListState(
        state: DataStateStates.success,
      );
      moviesListState.moviesList = [
        Movie.mockMovie(),
        Movie.mockMovie(),
      ];
      await mockNetworkImages(
        () async => tester.pumpWidget(
          MaterialAppWrapper(
              root: GridViewMoviesList(
            moviesListState: moviesListState,
          )),
        ),
      );
      expect(
        find.byType(GridViewItem),
        findsNWidgets(2),
      );
    },
  );
}
