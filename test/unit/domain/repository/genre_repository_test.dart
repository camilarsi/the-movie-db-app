import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/domain/repository/genre_repository.dart';

void main() {
  test(
    'fetchGenresById(List<dynamic> genresIds) test',
    () async {
      List<dynamic> genresIds = [28, 12, 16];
      final genreRepository = GenreRepository();
      TestWidgetsFlutterBinding.ensureInitialized();
      HttpOverrides.global = null;
      final genres = await genreRepository.fetchGenresById(genresIds);
      expectLater(
        genres,
        isInstanceOf<List<Genre>>(),
      );
      expectLater(
        genres,
        contains(
          Genre.mockGenre(),
        ),
      );
      expectLater(
        genres,
        hasLength(3),
      );
    },
  );
}
