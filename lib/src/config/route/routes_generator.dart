import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../domain/entity/genre.dart';
import '../../domain/entity/movie.dart';
import '../../presentation/view/home.dart';
import '../../presentation/view/movie_info_outer_layout.dart';

class RouteGenerator {
  static const String initialRoute = '/';
  static const String movieDetails = '/movieDetails';
  static const String notFoundMessage = 'Route Not Found';
  static const String movieGridByGenre = '/moviesGridByGenre';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case movieDetails:
        if (args is Movie) {
          return MaterialPageRoute(
            builder: (context) => MovieInfoOuterLayout(
              movie: args,
            ),
          );
        }
      case initialRoute:
        {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }
      case movieGridByGenre:
        if (args is Genre) {
          return MaterialPageRoute(
            builder: (context) => HomeScreen(
              genre: args,
            ),
          );
        } else {
          throw Exception(UiConstants.defaultFailMessage);
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
