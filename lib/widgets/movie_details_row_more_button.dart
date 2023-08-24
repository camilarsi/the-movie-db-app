import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class MoreButton extends StatelessWidget {
  final String moreButtonTextContent;
  const MoreButton({
    required this.moreButtonTextContent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          moreButtonTextContent,
          style: UiConstants.movieDetailsMoreButtonTextStyle,
        ),
      ],
    );
  }
}
