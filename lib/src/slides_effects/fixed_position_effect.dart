import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class FixedPositionEffect extends StatelessWidget {
  final Widget child;
  final double offsetX; // Horizontal offset
  final double offsetY; // Vertical offset

  // Named constructors for different sliding directions
  const FixedPositionEffect.horizontal({super.key, required this.child})
      : offsetX = 1.0, // Slide from left to center
        offsetY = 0.0;

  const FixedPositionEffect.horizontalReversed({super.key, required this.child})
      : offsetX = -1.0, // Slide from right to center
        offsetY = 0.0;

  const FixedPositionEffect.vertical({super.key, required this.child})
      : offsetX = 0.0,
        offsetY = -1.0; // Slide from top to center

  const FixedPositionEffect.verticalReversed({super.key, required this.child})
      : offsetX = 0.0,
        offsetY = 1.0;
  // Slide from bottom to center
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
