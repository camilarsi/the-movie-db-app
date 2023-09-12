import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../widget/hero_item.dart';
import '../widget/home_app_bar.dart';
import '../widget/movie_details_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.moviesHero,
    required this.moviesDetails,
    super.key,
  });
  final List<Movie> moviesDetails;
  final List<Movie> moviesHero;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageView = PageView(
      controller: _pageController,
      children: widget.moviesHero
          .map(
            (movie) => HeroItem(
              movie: movie,
            ),
          )
          .toList(),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const HomeAppBar(
        avatarText: UiConstants.homeHomeAppBarAvatarText,
      ),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        verticalDirection: VerticalDirection.down,
        children: [
          Flexible(
            flex: UiConstants.homeFlexibleFlexHero,
            child: pageView,
          ),
          const Padding(
            padding: UiConstants.homeFlexibleHeroPadding,
            child: Text(
              textAlign: TextAlign.left,
              UiConstants.homeMovieDetailsListViewTitle,
              style: UiConstants.homeContainerListViewTitleStyle,
            ),
          ),
          Flexible(
            flex: UiConstants.homeFlexibleFlexMovieDetailsListView,
            child: Stack(
              children: [
                ListView.builder(
                  itemCount: widget.moviesDetails.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (
                    BuildContext context,
                    int index,
                  ) {
                    return MovieDetailsItem(
                      movie: widget.moviesDetails[index],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
