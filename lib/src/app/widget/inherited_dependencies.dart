// external
import 'package:flutter/material.dart';

// internal
import '../data/dependencies.dart';

class InheritedDependencies extends InheritedWidget {
  const InheritedDependencies({
    super.key,
    required super.child,
    required this.dependencies,
  });

  final Dependencies dependencies;

  static Never _notFoundInheritedWidgetOfExactType() {
    throw ArgumentError('Not found InheritedWidget of InheritedDependencies Type');
  }

  static Dependencies? maybeOf(BuildContext context) {
    return (context.getElementForInheritedWidgetOfExactType<InheritedDependencies>()?.widget as InheritedDependencies?)
        ?.dependencies;
  }

  static Dependencies of(BuildContext context) => maybeOf(context) ?? _notFoundInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(InheritedDependencies oldWidget) => false;
}
