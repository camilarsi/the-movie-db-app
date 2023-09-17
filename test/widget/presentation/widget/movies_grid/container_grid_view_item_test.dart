import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/container_grid_view_item.dart';

import '../../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'should find a Network Image',
    (WidgetTester tester) async {
      await mockNetworkImages(() async => tester.pumpWidget(
            MaterialAppWrapper(
              root: ContainerGridViewItem(
                movie: Movie.mockMovie(),
              ),
            ),
          ));

      Container container = tester.widget(find.byType(Container));

      final boxDecoration = container.decoration as BoxDecoration;
      final decorationImage = boxDecoration.image as DecorationImage;
      final networkImage = decorationImage.image as NetworkImage;

      expect(networkImage.url, Movie.mockMovie().posterUrl);
    },
  );
}
