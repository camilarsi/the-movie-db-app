import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository.dart';
import '../../presentation/view/home.dart';
import '../../presentation/view/movie_info_outer_layout.dart';
import '../../presentation/widget/base_future_builder.dart';

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
