import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';

class PosterBackground extends StatelessWidget {
  final Movie movie;

  const PosterBackground({
    required this.movie,
    super.key,
  });

  static const double secondContainerHeightQueryOfContext = 0.85;
  static const double positionedHeightQueryOfContext = 0.15;
  static const double positionedBottom = 75;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                movie.posterUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          height: MediaQuery.of(context).size.height *
              positionedHeightQueryOfContext,
          width: MediaQuery.of(context).size.width,
          bottom: positionedBottom,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
