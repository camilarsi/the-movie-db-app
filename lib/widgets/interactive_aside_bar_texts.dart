import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class InteractiveAsideBarTexts extends StatelessWidget {
  final String textContent;

  const InteractiveAsideBarTexts({
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
