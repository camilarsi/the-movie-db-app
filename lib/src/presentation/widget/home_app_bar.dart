import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({
    required this.title,
    required this.avatarText,
    super.key,
  });

  final String avatarText;
  static const List<String> popupMenuOptions = [
    'Genres',
    'User Settings',
  ];

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: UiConstants.homeAppBarElevation,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(title),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.indigoAccent,
          child: Text(
            avatarText,
            style: UiConstants.homeAppBarCircleAvatarStyle,
          ),
        ),
      ],
    );
  }
}
