import 'package:flutter/material.dart';

class SlideShowFactors extends InheritedWidget {
  final double factor;
  final double rangeLimit;

  const SlideShowFactors({
    super.key,
    required this.factor,
    required this.rangeLimit,
    required super.child,
  });

  static SlideShowFactors? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SlideShowFactors>();
  }

  @override
  bool updateShouldNotify(SlideShowFactors oldWidget) {
    return factor != oldWidget.factor;
  }
}
