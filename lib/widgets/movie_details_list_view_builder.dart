import 'package:flutter/material.dart';

class ItemsListViewBuilder<T> extends StatelessWidget {
  const ItemsListViewBuilder({
    super.key,
    required this.builder,
    required this.items,
  });
  final List<T> items;
  final Widget Function(BuildContext, T) builder;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (
        BuildContext context,
        int index,
      ) {
        return builder(
          context,
          items[index],
        );
      },
    );
  }
}
