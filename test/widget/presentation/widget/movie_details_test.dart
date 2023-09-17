import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/presentation/widget/movie_details.dart';
import 'package:the_movie_db_app/src/presentation/widget/movie_details_row_more_button.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'should find the nested widgets',
    (WidgetTester tester) async {
      final movie = Movie.mockMovie();
      final title = movie.title;
      final originalTitle = movie.originalTitle;
      final overview = movie.overview;
      final releaseDate = movie.releaseDate;
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: MovieDetails(
            title: title,
            originalTitle: originalTitle,
            overview: overview,
            releaseDate: releaseDate,
          ),
        ),
      );
      expect(find.byType(Column), findsNWidgets(2));
      expect(
        find.text(title),
        findsOneWidget,
      );
      expect(
        find.text(overview),
        findsOneWidget,
      );
      expect(
        find.byType(MoreButton),
        findsOneWidget,
      );
    },
  );
}
