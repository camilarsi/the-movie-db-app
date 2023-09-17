import 'package:flutter/material.dart';

import '../custom_icon_button.dart';

class FixedSearchBarAppBar extends StatefulWidget {
  const FixedSearchBarAppBar({super.key});

  @override
  State<FixedSearchBarAppBar> createState() => _FixedSearchBarAppBarState();
}

class _FixedSearchBarAppBarState extends State<FixedSearchBarAppBar> {
  static const double containerElevation = 0;
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
    );
  }
}
