import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';

class InteractiveAsideBarText extends StatelessWidget {
  final String textContent;

  const InteractiveAsideBarText({
    super.key,
    required this.textContent,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textContent,
      style: UiConstants.interactiveAsideBarTextStyle,
    );
  }
}
