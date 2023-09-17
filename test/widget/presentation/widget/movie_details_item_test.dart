import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/presentation/widget/movie_details_item.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'should find a Stack and a Positioned',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: MovieDetailsItem(
            movie: Movie.mockMovie(),
          ),
        ),
      );
      expect(
        find.byType(Stack),
        findsOneWidget,
      );
      expect(
        find.byType(Positioned),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'should find a NetworkImage',
    (WidgetTester tester) async {
      await mockNetworkImages(
        () async => await tester.pumpWidget(
          MaterialAppWrapper(
            root: MovieDetailsItem(
              movie: Movie.mockMovie(),
            ),
          ),
        ),
      );
      final url = Movie.mockMovie().backdropUrl;
      expect(
        find.image(NetworkImage(url)),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    'Should find a text',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: MovieDetailsItem(
            movie: Movie.mockMovie(),
          ),
        ),
      );
      final url = Movie.mockMovie().backdropUrl;
      final image = tester.widget(
        find.image(
          NetworkImage(url),
        ),
      );
    },
  );
}
