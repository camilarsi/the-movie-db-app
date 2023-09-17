import 'package:flutter/material.dart';

import '../../../core/util/data_state.dart';
import '../../../core/util/ui_constants.dart';
import '../../../domain/entity/movies_list_state.dart';
import 'grid_view_movies_list.dart';

class StreamBuilderMoviesList extends StatefulWidget {
  final Stream<MoviesListState> stream;
  const StreamBuilderMoviesList({required this.stream, super.key});

  @override
  State<StreamBuilderMoviesList> createState() =>
      _StreamBuilderMoviesListState();
}

class _StreamBuilderMoviesListState extends State<StreamBuilderMoviesList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MoviesListState>(
      stream: widget.stream,
      builder: (
        BuildContext context,
        AsyncSnapshot<MoviesListState> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return UiConstants.containerGridCircularProgressIndicator;
        } else {
          final moviesListState = snapshot.data;
          switch (moviesListState?.state) {
            case DataStateStates.success:
              return GridViewMoviesList(
                moviesListState: moviesListState!,
              );
            default:
          }
        }
        return Container();
      },
    );
  }
}
