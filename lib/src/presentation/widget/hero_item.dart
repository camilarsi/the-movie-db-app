import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';

class HeroItem extends StatelessWidget {
  const HeroItem({
    required this.movie,
    super.key,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return const LinearGradient(
          colors: [
            Colors.white12,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ).createShader(bounds);
      },
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const LinearGradient(
            colors: [
              Colors.white12,
              Colors.white,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          ).createShader(bounds);
        },
        child: Image.network(
          movie.posterUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
