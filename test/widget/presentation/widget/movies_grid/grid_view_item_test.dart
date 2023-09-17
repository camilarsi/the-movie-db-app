import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/container_grid_view_item.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/grid_view_item.dart';

import '../../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find a ContainerGridVIewItem',
    (WidgetTester tester) async {
      await mockNetworkImages(
        () async => tester.pumpWidget(
          MaterialAppWrapper(
            root: GridViewItem(
              movie: Movie.mockMovie(),
            ),
          ),
        ),
      );
      expect(
        find.byType(ContainerGridViewItem),
        findsOneWidget,
      );
    },
  );
}
