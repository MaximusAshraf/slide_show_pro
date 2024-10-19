import 'package:flutter/material.dart';

class FactorInheritedWidget extends InheritedWidget {
  final double factor;

  const FactorInheritedWidget({
    super.key,
    required this.factor,
    required super.child,
  });

  static FactorInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<FactorInheritedWidget>();
  }

  @override
  bool updateShouldNotify(FactorInheritedWidget oldWidget) {
    return factor != oldWidget.factor;
  }
}
