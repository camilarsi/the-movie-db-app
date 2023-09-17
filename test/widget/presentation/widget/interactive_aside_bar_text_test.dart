import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/presentation/widget/interactive_aside_bar_texts.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find a text ',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: InteractiveAsideBarText(textContent: 'mock text content'),
        ),
      );
      expect(
        find.text('mock text content'),
        findsOneWidget,
      );
    },
  );
}
