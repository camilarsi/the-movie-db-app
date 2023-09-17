import 'package:flutter_test/flutter_test.dart';
import 'package:the_movie_db_app/src/domain/entity/genre.dart';

void main() {
  test(
    'Genre.fromJson(Map<String, dynamic> json) test, should return a Genre with specific attributes values',
    () {
      Map<String, dynamic> json = {'id': 28, 'name': 'Action'};
      expect(
        Genre.fromJson(json),
        equals(
          Genre(id: 28, name: 'Action'),
        ),
      );
    },
  );
  test(
    'Genre.MockGenre() factory test, should return a Genre',
    () {
      expect(
        Genre.mockGenre(),
        Genre(id: 28, name: 'Action'),
      );
    },
  );
  test(
    'List<Genre> fromJsonList(List<dynamic> json) test, should return a List<Genre>',
    () {
      List<dynamic> json = [
        {
          'id': 28,
          'name': 'Action',
        },
        {
          'id': 28,
          'name': 'Action',
        },
        {
          'id': 28,
          'name': 'Action',
        },
      ];
      List<Genre> genresList = [
        Genre.mockGenre(),
        Genre.mockGenre(),
        Genre.mockGenre()
      ];
      expect(
        Genre.fromJsonList(json),
        isInstanceOf<List<Genre>>(),
      );
      expect(
        Genre.fromJsonList(json),
        hasLength(3),
      );
    },
  );
  test(
    '==(Object other) test, different objects, same values should be true',
    () {
      Genre mockGenre1 = Genre.mockGenre();
      Genre mockGenre2 = Genre.mockGenre();
      expect(
        mockGenre1 == mockGenre2,
        isTrue,
      );
    },
  );
  test(
    '==(Object other) test, two objects with different values should be false',
    () {
      Genre otherGenre = Genre(id: 45, name: 'mockOtherGenre');
      expect(
        Genre.mockGenre() == otherGenre,
        isFalse,
      );
    },
  );
}
