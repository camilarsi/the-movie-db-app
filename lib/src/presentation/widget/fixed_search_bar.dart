import 'package:flutter/material.dart';

import 'custom_icon_button.dart';

class FixedSearchBar extends StatelessWidget {
  const FixedSearchBar({
    super.key,
  });

  static const double positionedTop = 0;
  static const double positionedLeft = 0;
  static const double positionedRight = 0;
  static const double sizeBoxHeight = 125;
  static const double containerElevation = 0;
  @override
  Widget build(
    BuildContext context,
  ) {
    return Positioned(
      top: positionedTop,
      left: positionedLeft,
      right: positionedRight,
      child: SizedBox(
        height: sizeBoxHeight,
        child: AppBar(
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black54,
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          elevation: containerElevation,
          actions: const [
            CustomIconButton(
              icon: Icons.search,
              color: Colors.white,
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
