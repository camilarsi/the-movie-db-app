import 'package:flutter/material.dart';

import '../../models/movie.dart';
import '../../screens/movie_info_outer_layout.dart';
import '../screens/home.dart';
import 'base_future_builder.dart';
import 'movie_repository.dart';

class RouteGenerator {
  static const String initialRoute = '/';
  static const String movieDetailsRoute = '/movieDetails';
  static const String notFoundMessage = 'Route Not Found';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case movieDetailsRoute:
        if (args is Movie) {
          return MaterialPageRoute(
            builder: (context) => MovieInfoOuterLayout(
              movie: args,
            ),
          );
        }
      case initialRoute:
        {
          return MaterialPageRoute(
            builder: (context) => BaseFutureBuilder(
              future: MovieRepository.fetchMoviesDetails(),
              builder: (context, data) {
                return HomeScreen(
                  moviesHero: data.reversed.toList(),
                  moviesDetails: data,
                );
              },
            ),
          );
        }
      default:
        return _errorRoute();
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text(notFoundMessage),
        ),
      );
    });
  }
}
