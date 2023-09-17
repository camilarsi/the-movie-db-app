import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/core/util/movie_section.dart';
import 'package:the_movie_db_app/src/data/repository/remote_movies_list_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_movies_list_from_section.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_movies_list_from_section_by_genre.dart';

void main() {
  final section = MovieSection.nowPlaying.path;
  final displayMoviesListFromSection = DisplayMoviesListFromSection(
    repository: RemoteMoviesListRepository(
      Client(),
    ),
  );
  final displayMoviesListFromCategoryByGenre =
      DisplayMoviesListFromSectionByGenre(
          displayMoviesListFromSection: displayMoviesListFromSection);
  group(
    'containsGenre() tests',
    () {
      Genre mockGenre =
          Genre(id: Movie.mockMovie().genreIds[0], name: 'mockedGenreName');
      Movie movie = Movie.mockMovie();

      test(
        'containsGenre() test case movie contains genre',
        () {
          bool result = displayMoviesListFromCategoryByGenre.containsGenre(
              movie, mockGenre);
          expect(result, isTrue);
        },
      );
      test(
        'containsGenre() test case movie not contains genre',
        () {
          Genre mockGenre = Genre(id: -1, name: 'mockGenreName');
          bool result = displayMoviesListFromCategoryByGenre.containsGenre(
            movie,
            mockGenre,
          );
          expect(
            result,
            isFalse,
          );
        },
      );
    },
  );
  test(
    'fetchMoviesListByGenre() test, should return a DataState<List<Movie>> ',
    () async {
      DataState<List<Movie>> expectedDataState =
          await displayMoviesListFromCategoryByGenre.fetchMoviesListByGenre(
        section,
        Genre.mockGenre(),
      );
      expectLater(
        expectedDataState,
        isInstanceOf<DataState<List<Movie>>>(),
      );
      expect(
        expectedDataState.data?[0].genreIds,
        contains(Genre.mockGenre().id),
      );
      expect(
        expectedDataState.data![expectedDataState.data!.length - 1].genreIds,
        contains(Genre.mockGenre().id),
      );
    },
  );
}
