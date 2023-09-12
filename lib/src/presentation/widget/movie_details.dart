import 'package:flutter/material.dart';

import 'movie_details_row_more_button.dart';

class MovieDetails extends StatelessWidget {
  final String title;
  final String originalTitle;
  final String overview;
  final String releaseDate;

  const MovieDetails({
    super.key,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
  });
  static const double textStyleFontSize = 16;
  static const double textStyleShadowOffsetX = 0;
  static const double textStyleShadowOffsetY = 1;
  static const double textStyleShadowBlurRadius = 2;
  static const overviewMaxLines = 2;
  static const moreButtonTextContent = "more...";
  static const TextStyle movieDetailsTextStyle = TextStyle(
    fontSize: textStyleFontSize,
    color: Colors.white,
    shadows: [
      Shadow(
        color: Colors.black,
        offset: Offset(
          textStyleShadowOffsetX,
          textStyleShadowOffsetY,
        ),
        blurRadius: textStyleShadowBlurRadius,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: movieDetailsTextStyle.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              overview,
              style: movieDetailsTextStyle,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              maxLines: overviewMaxLines,
            ),
          ],
        ),
        const MoreButton(
          moreButtonTextContent: moreButtonTextContent,
        )
      ],
    );
  }
}
