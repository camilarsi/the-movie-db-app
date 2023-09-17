import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/presentation/widget/home_app_bar.dart';

void main() {
  String titleText = 'title text test';
  String avatarText = 'avatar text test';

  testWidgets(
    'should deploy an appBar with a title and a avatarText',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: HomeAppBar(
              title: titleText,
              avatarText: avatarText,
            ),
          ),
        ),
      );
      var homeAppBar = find.byType(AppBar);
      expect(find.text(titleText), findsOneWidget);
      expect(find.text(avatarText), findsOneWidget);
      expect(homeAppBar, findsOneWidget);
    },
  );
}
