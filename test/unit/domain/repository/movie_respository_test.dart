import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/repository/movie_repository.dart';

void main() {
  test(
    'fetchMoviesList() test',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      HttpOverrides.global = null;
      MovieRepository movieRepository = MovieRepository();
      final movies = await movieRepository.fetchMoviesList();
      expectLater(
        movies,
        isInstanceOf<List<Movie>>(),
      );
    },
  );
}
