import 'package:flutter/material.dart';

import '../../presentation/widget/genre_container.dart';

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

  static Container containerGridCircularProgressIndicator = Container(
    alignment: Alignment.center,
    height: 10,
    child: const CircularProgressIndicator(),
  );

  static const crossAxisCountMoviesGrid = 2;
  static const EdgeInsetsGeometry paddingEdgeMoviesGrid = EdgeInsets.all(7);
  static BoxDecoration homeScreenTapBarIndicator = BoxDecoration(
    borderRadius: BorderRadius.circular(50), // Creates border
    color: Colors.grey.withOpacity(0.4),
  );

  static String get apiKey => 'bf81766804766e6fd33ab126ed2631b6';
  static String get baseUrl => 'https://api.themoviedb.org/3/';

  static const String badRequestHttpStatusMessage = 'Bad request';
  static const String notFoundHttpStatusMessage =
      'The request resource was not found';
  static const String internalServerErrorHttpStatusMessage =
      'An internal server error occurred';
  static const String defaultFailMessage = 'Oops! Something went wrong';
  static const String emptyResponseMessage = 'The response is empty';

  static const String homeAppBarBaseTittle = 'TMDBApp ';
}
