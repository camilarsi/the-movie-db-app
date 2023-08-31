import 'package:flutter/material.dart';

class PosterBackground extends StatelessWidget {
  final String url;

  const PosterBackground({
    required this.url,
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
          height: MediaQuery.of(context).size.height *
              secondContainerHeightQueryOfContext,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                url,
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
