import 'package:flutter/material.dart';

import '../../../core/util/ui_constants.dart';
import '../../../domain/entity/movie.dart';
import 'container_grid_view_item.dart';

class GridViewItem extends StatefulWidget {
  final Movie movie;
  const GridViewItem({
    required this.movie,
    super.key,
  });

  @override
  State<GridViewItem> createState() => _GridViewItemState();
}

class _GridViewItemState extends State<GridViewItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: UiConstants.paddingEdgeMoviesGrid,
      child: ContainerGridViewItem(
        movie: widget.movie,
      ),
    );
  }
}
