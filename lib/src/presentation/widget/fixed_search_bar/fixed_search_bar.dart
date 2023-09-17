import 'package:flutter/material.dart';

import 'fixed_search_bar_app_bar.dart';

class FixedSearchBar extends StatelessWidget {
  const FixedSearchBar({
    super.key,
  });

  static const double positionedTop = 0;
  static const double positionedLeft = 0;
  static const double positionedRight = 0;
  static const double sizeBoxHeight = 125;

  @override
  Widget build(
    BuildContext context,
  ) {
    return const Positioned(
      top: positionedTop,
      left: positionedLeft,
      right: positionedRight,
      child: SizedBox(
        height: sizeBoxHeight,
        child: FixedSearchBarAppBar(),
      ),
    );
  }
}
