import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/presentation/widget/custom_drawer/custom_drawer_list_tile_text.dart';

import '../../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'should find a text with a Genre name ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: CustomDrawerListTileText(
            genre: Genre.mockGenre(),
          ),
        ),
      );
      //await tester.pumpAndSettle();
      expect(
        find.text(
          Genre.mockGenre().name,
          skipOffstage: false,
        ),
        findsOneWidget,
      );
    },
  );
}
