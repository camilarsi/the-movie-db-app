import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/repository/genre_repository.dart';
import 'package:the_movie_db_app/src/presentation/widget/movie_information.dart';

import '../../../utils/material_app_wrapper.dart';

class MockGenreRepository extends Mock implements GenreRepository {
  @override
  Future<List<Genre>> fetchGenresById(List<dynamic> genresIds) async {
    return Future.value([Genre.mockGenre(), Genre.mockGenre()]);
  }
}

void main() {
  testWidgets(
    'Should find two nested Paddings',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialAppWrapper(
          root: MovieInformation(
            genreRepository: MockGenreRepository(),
            movie: Movie.mockMovie(),
          ),
        ),
      );
      expect(
        find.byType(Padding),
        findsNWidgets(3),
      );
      expect(
        find.byType(Column),
        findsWidgets,
      );
      expect(
        find.byType(Row),
        findsWidgets,
      );
    },
  );
}
