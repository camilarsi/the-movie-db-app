import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/genre.dart';

class GenreRepository {
  static const String genresDataSource = 'assets/movies_data/genres.json';

  static Future<List<Genre>> fetchGenresById(List<dynamic> genresIds) async {
    final String response = await rootBundle.loadString(genresDataSource);
    final List<dynamic> jsonList = await jsonDecode(response)['genres'];
    final List<Genre> dataGenres = [];
    for (final genreMap in jsonList) {
      if (genresIds.contains(genreMap['id'])) {
        final genre = Genre.fromJson(genreMap);
        dataGenres.add(genre);
      }
    }
    return dataGenres.toList();
  }
}
