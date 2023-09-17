import 'package:flutter/material.dart';

import '../../bloc/movies_grid_bloc.dart';
import 'stream_builder_movies_list.dart';

class MoviesGrid extends StatefulWidget {
  final MoviesGridBloc moviesBloc;
  const MoviesGrid({
    required this.moviesBloc,
    super.key,
  });

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  @override
  void initState() {
    super.initState();
    widget.moviesBloc.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilderMoviesList(
      stream: widget.moviesBloc.dataStream,
    );
  }
}
