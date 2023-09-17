import 'package:flutter/material.dart';

import '../../../config/route/routes_generator.dart';
import '../../../domain/entity/movie.dart';

class ContainerGridViewItem extends StatefulWidget {
  final Movie movie;
  const ContainerGridViewItem({
    required this.movie,
    super.key,
  });

  @override
  State<ContainerGridViewItem> createState() => _ContainerGridViewItemState();
}

class _ContainerGridViewItemState extends State<ContainerGridViewItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            widget.movie.posterUrl,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteGenerator.movieDetails,
            arguments: widget.movie,
          );
        },
      ),
    );
  }
}
