import 'dart:convert';

import 'package:flutter/services.dart';

import '../entity/movie.dart';

class MovieRepository {
  static const String moviesDataSource = 'assets/movies_data/movies.json';

  MovieRepository();

  Future<List<Movie>> fetchMoviesList() async {
    final String response = await rootBundle.loadString(moviesDataSource);
    final json = await jsonDecode(response);
    final List<Movie> dataMovies = [];
    for (var jsonObj in json) {
      dataMovies.add(Movie.fromMoviesListBySectionJsonResult(jsonObj));
    }
    return dataMovies;
  }
}
