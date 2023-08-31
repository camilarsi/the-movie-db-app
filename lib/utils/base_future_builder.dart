import 'package:flutter/material.dart';

class BaseFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext, T) builder;
  final Widget loadingWidget;
  final Widget errorWidget;

  const BaseFutureBuilder({
    required this.future,
    required this.builder,
    this.loadingWidget = const CircularProgressIndicator(),
    this.errorWidget = const Text('Base Future Builder error'),
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return loadingWidget;
        } else if (snapshot.hasError) {
          return errorWidget;
        } else {
          return builder(context, snapshot.data as T);
        }
      },
    );
  }
}
