import 'package:flutter/material.dart';

import '../widgets/genre_container.dart';

abstract class UiConstants {
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p/w500';

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
  static const genreContainerTextStyle = TextStyle(
    color: Colors.white,
    fontSize: GenreContainer.textStyleFontSize,
    shadows: [
      UiConstants.standardShadow,
    ],
  );
  static const movieDetailTitleStyle = TextStyle(
    decoration: TextDecoration.none,
    fontSize: 15,
    fontFamily: 'Inter',
    color: Colors.white,
  );
  static const homeAppBarTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 19,
    fontFamily: 'Inter',
  );
  static const homeAppBarCircleAvatarStyle = TextStyle(
    color: Colors.white,
    fontSize: 17,
  );
  static const homeAppText = 'The Movie Db App';
  static const TextStyle homeContainerListViewTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 15,
      decoration: TextDecoration.none,
      fontFamily: 'Inter');
  static const EdgeInsetsGeometry movieDetailsItemImagePadding =
      EdgeInsets.only(right: 10);
  static const EdgeInsetsGeometry movieDetailsItemMovieTitlePadding =
      EdgeInsets.all(8);
  static const double movieDetailsItemTextPositionBottom = 0;
  static const double movieDetailsItemImageWidth = 260;
  static const double homeAppBarElevation = 0;
  static const homeHomeAppBarAvatarText = 'U';
  static const homeMovieDetailsListViewTitle = 'New';
  static const homeFlexibleFlexHero = 3;
  static const EdgeInsetsGeometry homeFlexibleHeroPadding = EdgeInsets.all(
    15.0,
  );
  static const homeFlexibleFlexMovieDetailsListView = 1;
}
