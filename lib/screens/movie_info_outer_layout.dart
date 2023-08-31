import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../widgets/fixed_search_bar.dart';
import '../widgets/interactive_aside_bar.dart';
import '../widgets/movie_information.dart';
import '../widgets/poster_background.dart';

class MovieInfoOuterLayout extends StatelessWidget {
  const MovieInfoOuterLayout({
    super.key,
    required this.positionedBottom,
    required this.movie,
  });

  final double positionedBottom;

  //TODO fetch from movies JSON/API source:
  final Movie movie;
  static const likesNumber = 1234;
  static const voteAverage = 7.8;
  static const views = 12345;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (
            BuildContext context,
            BoxConstraints constrains,
          ) {
            return Stack(
              children: [
                PosterBackground(
                  url: movie.imgURL,
                ),
                const FixedSearchBar(),
                Positioned(
                  bottom: positionedBottom,
                  width: MediaQuery.of(context).size.width,
                  child: MovieInformation(
                    movie: movie,
                  ),
                ),
                InteractiveAsideBar(
                  likesNumber: likesNumber,
                  voteAverage: voteAverage,
                  views: views,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
