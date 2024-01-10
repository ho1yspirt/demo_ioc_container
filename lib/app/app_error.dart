import 'package:flutter/material.dart';

class AppError extends StatelessWidget {
  const AppError({super.key, required this.e});

  final Object? e;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: Text(e.toString()))));
  }
}
