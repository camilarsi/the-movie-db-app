import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/presentation/widget/poster_background.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find the nested widgets',
    (WidgetTester tester) async {
      await mockNetworkImages(
        () async => tester.pumpWidget(
          MaterialAppWrapper(
            root: PosterBackground(
              movie: Movie.mockMovie(),
            ),
          ),
        ),
      );
      expect(
        find.byType(Container),
        findsNWidgets(3),
      );
      expect(
        find.byType(Positioned),
        findsWidgets,
      );
    },
  );
}
