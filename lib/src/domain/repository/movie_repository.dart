import 'dart:convert';

import 'package:flutter/services.dart';

import '../entity/movie.dart';

class MovieRepository {
  static const String moviesDataSource = 'assets/movies_data/movies.json';

  MovieRepository();

  static Future<List<Movie>> fetchMoviesDetails() async {
    final String response = await rootBundle.loadString(moviesDataSource);
    final json = await jsonDecode(response);
    final List<Movie> dataMovies = [];
    for (var jsonObj in json) {
      dataMovies.add(Movie.fromJson(jsonObj));
    }
    return dataMovies;
  }

  static Future<Movie> fetchMovieDetails(int movieId) async {
    final movies = await fetchMoviesDetails();
    final movie = movies.indexWhere((Movie movie) => movie.id == movieId);
    return movie as Future<Movie>;
  }
}
