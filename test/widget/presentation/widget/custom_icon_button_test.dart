import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/presentation/widget/custom_icon_button.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find an icon',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialAppWrapper(
          root: CustomIconButton(
            icon: Icons.favorite,
            color: Colors.brown,
          ),
        ),
      );
      expect(find.byIcon(Icons.favorite), findsOneWidget);
    },
  );
}
