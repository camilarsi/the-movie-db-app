import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/presentation/view/home.dart';
import 'package:the_movie_db_app/src/presentation/widget/custom_inherited_widget.dart';
import 'package:the_movie_db_app/src/presentation/widget/home_app_bar.dart';
import 'package:the_movie_db_app/src/presentation/widget/movies_grid/movies_grid.dart';

import '../../../utils/material_app_wrapper.dart';

void main() {
  testWidgets(
    'Should find the nested widget',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialAppWrapper(
          root: HomeScreen(),
        ),
      );
      expect(
        find.byType(CustomInheritedWidget),
        findsOneWidget,
      );
      expect(
        find.byType(DefaultTabController),
        findsOneWidget,
      );
      expect(
        find.byType(Scaffold),
        findsOneWidget,
      );
      expect(
        find.byType(HomeAppBar),
        findsOneWidget,
      );
      expect(
        find.text('TMDBApp'),
        findsOneWidget,
      );
      expect(
        find.byType(TabBar),
        findsOneWidget,
      );
      expect(
        find.byType(TabBarView),
        findsOneWidget,
      );
      expect(
        find.byType(MoviesGrid),
        findsOneWidget,
      );
    },
  );
}
