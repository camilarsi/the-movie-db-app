import 'package:flutter/material.dart';

class MaterialAppWrapper extends StatefulWidget {
  final Widget root;

  const MaterialAppWrapper({
    required this.root,
    super.key,
  });

  @override
  State<MaterialAppWrapper> createState() => _MaterialAppWrapperState();
}

class _MaterialAppWrapperState extends State<MaterialAppWrapper> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget.root,
    );
  }
}
