import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:the_movie_db_app/src/core/util/data_state.dart';
import 'package:the_movie_db_app/src/data/repository/remote_movie_detail_repository.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';
import 'package:the_movie_db_app/src/domain/useCase/display_movie_detail_.dart';

void main() {
  test(
    'fetchMovieDetail() test, should return a DataState<Movie>',
    () async {
      final repository = RemoteMovieDetailRepository(
        Client(),
      );
      DisplayMovieDetail displayMovieDetail = DisplayMovieDetail(
        repository: repository,
      );
      final int movieId = Movie.mockMovie().id;
      final result = await displayMovieDetail.fetchMovieDetail(movieId);
      expectLater(
        result,
        isInstanceOf<DataState<Movie>>(),
      );
    },
  );
}
