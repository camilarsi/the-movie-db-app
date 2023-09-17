import 'package:flutter/material.dart';

import '../../../domain/entity/genre.dart';

class CustomDrawerListTileText extends StatelessWidget {
  final Genre genre;
  const CustomDrawerListTileText({
    required this.genre,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      genre.name,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
