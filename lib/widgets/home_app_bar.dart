import 'package:flutter/material.dart';
import 'package:the_movie_db_app/utils/ui_constants.dart';
import 'package:the_movie_db_app/widgets/custom_icon_button.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
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
      title: const Text(
        UiConstants.homeAppText,
      ),
      leading: PopupMenuButton<String>(
        onSelected: (item) => () {},
        child: const CustomIconButton(
          color: Colors.white,
          icon: Icons.menu,
        ),
        itemBuilder: (context) => popupMenuOptions
            .map(
              (option) => PopupMenuItem(
                value: option,
                child: Text(option),
              ),
            )
            .toList(),
      ),
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
