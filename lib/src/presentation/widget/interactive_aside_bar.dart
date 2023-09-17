import 'package:flutter/material.dart';

import '../../core/util/big_number.dart';
import 'custom_icon_button.dart';
import 'interactive_aside_bar_texts.dart';

class InteractiveAsideBar extends StatefulWidget {
  late int likesNumber;
  final double voteAverage;
  late int views;
  InteractiveAsideBar(
      {required this.likesNumber,
      required this.voteAverage,
      required this.views,
      super.key});

  @override
  State<InteractiveAsideBar> createState() => _InteractiveAsideBarState();
}

class _InteractiveAsideBarState extends State<InteractiveAsideBar> {
  bool like = false;

  static const Color iconColor = Colors.white;
  static const double positionedRight = 0;
  static const double positionedTopQueryOfContextSizeHeight = 0.4;
  static const double positionedHeightQueryOfContextSizeHeight = 0.5;
  static const double paddingEdgeAll = 7;
  static const double customIconButtonColorOpacity = 0.9;

  @override
  Widget build(BuildContext context) {
    int likesTotal = like ? widget.likesNumber + 1 : widget.likesNumber;

    String likesString = BigNumber(likesTotal).getShortString();
    String voteAverageString = widget.voteAverage.toString();
    String viewsString = BigNumber(widget.views).getShortString();

    return Positioned(
      right: positionedRight,
      top: MediaQuery.of(context).size.height *
          positionedTopQueryOfContextSizeHeight,
      height: MediaQuery.of(context).size.height *
          positionedHeightQueryOfContextSizeHeight,
      child: Padding(
        padding: const EdgeInsets.all(paddingEdgeAll),
        child: Column(
          children: [
            CustomIconButton(
              icon: Icons.favorite,
              color: like
                  ? Colors.redAccent.withOpacity(
                      customIconButtonColorOpacity,
                    )
                  : iconColor,
              onPressed: () => setState(
                () {
                  like = !like;
                },
              ),
            ),
            InteractiveAsideBarText(
              textContent: likesString,
            ),
            const CustomIconButton(
              icon: Icons.star,
              color: iconColor,
            ),
            InteractiveAsideBarText(
              textContent: voteAverageString,
            ),
            const CustomIconButton(
              icon: Icons.remove_red_eye,
              color: iconColor,
            ),
            InteractiveAsideBarText(
              textContent: viewsString,
            ),
          ],
        ),
      ),
    );
  }
}
