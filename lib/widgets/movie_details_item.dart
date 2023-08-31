import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../utils/ui_constants.dart';

class MovieDetailsItem extends StatelessWidget {
  final Movie movie;
  const MovieDetailsItem({
    required this.movie,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/movieDetails', arguments: movie);
      },
      child: Stack(
        children: [
          Padding(
            padding: UiConstants.movieDetailsItemImagePadding,
            child: Image.network(
              width: UiConstants.movieDetailsItemImageWidth,
              movie.backdropUrl,
              errorBuilder: (
                context,
                error,
                stackTrace,
              ) {
                return Text(
                  error.toString(),
                );
              },
            ),
          ),
          Positioned(
            bottom: UiConstants.movieDetailsItemTextPositionBottom,
            child: Container(
              color: Colors.black54,
              child: Padding(
                padding: UiConstants.movieDetailsItemMovieTitlePadding,
                child: Text(
                  textAlign: TextAlign.center,
                  movie.title,
                  style: UiConstants.movieDetailTitleStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
