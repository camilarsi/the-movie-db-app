import 'package:flutter/material.dart';

import '../utils/ui_constants.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onPressed;
  final double customIconSize = 35;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.color,
    this.onPressed,
  });

  static const customIconButtonShadow = UiConstants.standardShadow;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
        shadows: const [
          customIconButtonShadow,
        ],
      ),
      onPressed: onPressed,
      iconSize: customIconSize,
    );
  }
}
