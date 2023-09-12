import 'package:flutter/material.dart';

import '../../domain/entity/genre.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/genre_repository.dart';
import 'base_future_builder.dart';
import 'genre_container.dart';
import 'movie_details.dart';

class MovieInformation extends StatelessWidget {
  final Movie movie;
  const MovieInformation({
    super.key,
    required this.movie,
  });

  static const double paddingEdgeOnlyRightQueryContextSizeWidth = 0.1;
  static const double paddingEdgeOnlyRightQueryContextSizeTop = 90;
  static const double columnFirstPaddingEdgeSymmetricHorizontal = 10;
  static const double columnSecondPaddingEdgeOnlyBottom = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: MediaQuery.of(context).size.width *
            paddingEdgeOnlyRightQueryContextSizeWidth,
        top: paddingEdgeOnlyRightQueryContextSizeTop,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: columnFirstPaddingEdgeSymmetricHorizontal,
            ),
            child: MovieDetails(
              title: movie.title,
              originalTitle: movie.originalTitle,
              overview: movie.overview,
              releaseDate: movie.releaseDate,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: columnSecondPaddingEdgeOnlyBottom,
            ),
            child: BaseFutureBuilder<List<Genre>>(
              future: GenreRepository.fetchGenresById(
                movie.genreIds.toList(),
              ),
              builder: (
                context,
                data,
              ) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: data
                      .map(
                        (genre) => GenreContainer(
                          genre: genre,
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
