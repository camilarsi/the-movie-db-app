import 'package:flutter/material.dart';

abstract class UiConstants {
  static const standardShadow = Shadow(
    color: Colors.black,
    offset: Offset(0, 1),
    blurRadius: 2,
  );
  static const interactiveAsideBarTextStyle = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    shadows: [standardShadow],
  );
  static const movieDetailsMoreButtonTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    color: Colors.white,
    height: 2,
  );
}
