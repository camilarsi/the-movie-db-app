import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/presentation/widget/hero_item.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find an Image',
    (WidgetTester tester) async {
      await mockNetworkImages(
        () async => await tester.pumpWidget(
          MaterialAppWrapper(
            root: HeroItem(
              movie: Movie.mockMovie(),
            ),
          ),
        ),
      );
      expect(find.byType(Image), findsOneWidget);
    },
  );
}
