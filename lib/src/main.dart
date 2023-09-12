import 'package:flutter/material.dart';

import 'config/route/routes_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const String appTitle = 'The Movie DB App';
    return MaterialApp(
      title: appTitle,
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
