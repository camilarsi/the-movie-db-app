import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/presentation/view/movie_info_outer_layout.dart';
import 'package:the_movie_db_app/src/presentation/widget/poster_background.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find the nested widgets',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: MovieInfoOuterLayout(
            movie: Movie.mockMovie(),
          ),
        ),
      );
      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
      expect(
        find.byType(SafeArea),
        findsOneWidget,
      );
    },
  );
  testWidgets(
    ' ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: MovieInfoOuterLayout(
            movie: Movie.mockMovie(),
          ),
        ),
      );
      expect(
          find.descendant(
            of: find.byType(MovieInfoOuterLayout),
            matching: find.byType(PosterBackground, skipOffstage: false),
          ),
          findsOneWidget);
    },
  );
}
