import 'package:flutter/material.dart';

import '../../../core/util/ui_constants.dart';
import '../../../domain/entity/movies_list_state.dart';
import 'grid_view_item.dart';

class GridViewMoviesList extends StatefulWidget {
  final MoviesListState moviesListState;
  const GridViewMoviesList({
    required this.moviesListState,
    super.key,
  });

  @override
  State<GridViewMoviesList> createState() => _GridViewMoviesListState();
}

class _GridViewMoviesListState extends State<GridViewMoviesList> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: UiConstants.crossAxisCountMoviesGrid,
      children: widget.moviesListState.data!.map(
        (movie) {
          return GridViewItem(
            movie: movie,
          );
        },
      ).toList(),
    );
  }
}
