import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class SlideEffect extends StatelessWidget {
  final Widget child;
  final double offsetX; // Horizontal offset
  final double offsetY; // Vertical offset

  // Named constructors for different sliding directions
  const SlideEffect.fromLeft({super.key, required this.child})
      : offsetX = -1.0, // Slide from left to center
        offsetY = -1.0;

  const SlideEffect.fromRight({super.key, required this.child})
      : offsetX = 1.0, // Slide from right to center
        offsetY = -1.0;

  const SlideEffect.fromTop({super.key, required this.child})
      : offsetX = 0.0,
        offsetY = -2.0; // Slide from top to center

  const SlideEffect.fromBottom({super.key, required this.child})
      : offsetX = 0.0,
        offsetY = 2.0; // Slide from bottom to center

  @override
  Widget build(BuildContext context) {
    // Access the factor from the FactorInheritedWidget
    double factor = FactorInheritedWidget.of(context)?.factor ?? 0.0;

    // Calculate final offsets based on factor
    final effectiveOffsetX = offsetX * factor;
    final effectiveOffsetY = offsetY * factor;

    return FractionalTranslation(
      translation: Offset(effectiveOffsetX,
          effectiveOffsetY), // Slide the widget based on offsets
      child: child,
    );
  }
}
