import 'package:flutter/material.dart';

import '../models/genre.dart';
import '../utils/ui_constants.dart';

class GenreContainer extends StatelessWidget {
  final Genre genre;

  const GenreContainer({
    super.key,
    required this.genre,
  });

  static const double containerPaddingEdgeVertical = 3;
  static const double containerPaddingEdgeHorizontal = 8;
  static const double containerBoxDecorationColorOpacity = 0.4;
  static const double containerBoxDecorationBorderRadius = 10;
  static const double textStyleFontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: containerPaddingEdgeVertical,
        horizontal: containerPaddingEdgeHorizontal,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(
          containerBoxDecorationColorOpacity,
        ),
        borderRadius: BorderRadius.circular(
          containerBoxDecorationBorderRadius,
        ),
      ),
      child: Text(
        genre.name,
        style: UiConstants.genreContainerTextStyle,
      ),
    );
  }
}
