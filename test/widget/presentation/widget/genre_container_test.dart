import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/presentation/widget/genre_container.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find a Text with a Genre name',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialAppWrapper(
          root: GenreContainer(
        genre: Genre.mockGenre(),
      )));

      expect(find.text(Genre.mockGenre().name), findsOneWidget);
    },
  );
}
