import 'package:flutter/material.dart';

import 'models/movie.dart';
import 'screens/movie_info_outer_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Movie movie = Movie.mockMovie();
    const double positionedBottom = 0;
    const String appTitle = 'The Movie DB App';
    return MaterialApp(
      title: appTitle,
      home: MovieInfoOuterLayout(
        positionedBottom: positionedBottom,
        movie: movie,
      ),
    );
  }
}
