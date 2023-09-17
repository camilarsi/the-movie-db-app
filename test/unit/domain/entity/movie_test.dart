import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/movie.dart';

void main() {
  test(
    'fromJsonList(List<dynamic> json) test, should return a List<Movie>',
    () {
      List<dynamic> json = [
        {
          'id': 926393,
          'original_title': "The Equalizer 3",
          'overview':
              "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
          'poster_path': "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
          'release_date': "2023-08-30",
          'title': "The Equalizer 3",
          'vote_average': 7.357,
          'genre_ids': [28, 53, 80],
          'backdrop_path': "/cHNqobjzfLj88lpIYqkZpecwQEC.jpg",
        },
        {
          'id': 926393,
          'original_title': "The Equalizer 3",
          'overview':
              "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
          'poster_path': "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
          'release_date': "2023-08-30",
          'title': "The Equalizer 3",
          'vote_average': 7.357,
          'genre_ids': [28, 53, 80],
          'backdrop_path': "/cHNqobjzfLj88lpIYqkZpecwQEC.jpg",
        }
      ];
      expect(
        Movie.fromJsonList(json),
        isInstanceOf<List<Movie>>(),
      );
      expect(
        Movie.fromJsonList(json),
        hasLength(2),
      );
    },
  );
  test(
    'Movie.fromJson(Map<String, dynamic> json test, should return a Movie',
    () {
      Map<String, dynamic> json = {
        'id': 926393,
        'original_title': "The Equalizer 3",
        'overview':
            "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
        'poster_path': "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
        'release_date': "2023-08-30",
        'title': "The Equalizer 3",
        'vote_average': 7.357,
        'genre_ids': [28, 53, 80],
        'backdrop_path': "/cHNqobjzfLj88lpIYqkZpecwQEC.jpg",
      };
      expect(
        Movie.fromMoviesListBySectionJsonResult(json),
        isInstanceOf<Movie>(),
      );
      expect(
        Movie.fromMoviesListBySectionJsonResult(json),
        equals(
          Movie.mockMovie(),
        ),
      );
    },
  );
  test(
    'Movie.mockMovie() factory test, should return a Movie ',
    () {
      Movie movie = Movie(
        id: 926393,
        title: "The Equalizer 3",
        originalTitle: "The Equalizer 3",
        overview:
            "Robert McCall finds himself at home in Southern Italy but he discovers his friends are under the control of local crime bosses. As events turn deadly, McCall knows what he has to do: become his friends' protector by taking on the mafia.",
        releaseDate: "2023-08-30",
        voteAverage: 7.357,
        genreIds: [28, 53, 80],
        posterPath: "/b0Ej6fnXAP8fK75hlyi2jKqdhHz.jpg",
        backdropPath: "/cHNqobjzfLj88lpIYqkZpecwQEC.jpg",
      );
      expect(
        Movie.mockMovie(),
        isInstanceOf<Movie>(),
      );
      expect(
        movie,
        equals(
          Movie.mockMovie(),
        ),
      );
    },
  );
  test(
    '==(Object object) test,  different objects, same values should be true',
    () {
      Movie mockMovie1 = Movie.mockMovie();
      Movie mockMovie2 = Movie.mockMovie();
      expect(
        mockMovie1 == mockMovie2,
        isTrue,
      );
    },
  );
  test(
    '==(Object other) test, two objects with different values should be false',
    () {
      Movie movie = Movie(
        id: -1,
        title: "Different title ",
        originalTitle: "The",
        overview: "Something different",
        releaseDate: "different date",
        voteAverage: -1,
        genreIds: [-1],
        posterPath: "/.jpg",
        backdropPath: "/.jpg",
      );
      expect(
        movie == Movie.mockMovie(),
        isFalse,
      );
    },
  );
}
