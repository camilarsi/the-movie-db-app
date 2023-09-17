import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';
import '../../domain/repository/genre_repository.dart';
import '../widget/fixed_search_bar/fixed_search_bar.dart';
import '../widget/interactive_aside_bar.dart';
import '../widget/movie_information.dart';
import '../widget/poster_background.dart';

class MovieInfoOuterLayout extends StatelessWidget {
  const MovieInfoOuterLayout({
    super.key,
    required this.movie,
  });

  final Movie movie;
  static const likesNumber = 1234;
  static const voteAverage = 7.8;
  static const views = 12345;
  static const double positionedBottom = 0;

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
                  movie: movie,
                ),
                const FixedSearchBar(),
                Positioned(
                  bottom: positionedBottom,
                  width: MediaQuery.of(context).size.width,
                  child: MovieInformation(
                    genreRepository: GenreRepository(),
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
