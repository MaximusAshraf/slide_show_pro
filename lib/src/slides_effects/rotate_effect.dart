import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class RotateEffect extends StatelessWidget {
  final Widget child;
  final double rotationAngle; // Rotation angle in radians

  // Named constructors for different rotation directions
  const RotateEffect.fromLeft({super.key, required this.child})
      : rotationAngle = -1.0; // Rotate clockwise from the left

  const RotateEffect.fromRight({super.key, required this.child})
      : rotationAngle = 1.0; // Rotate counter-clockwise from the right

  @override
  Widget build(BuildContext context) {
    // Access the factor from the FactorInheritedWidget
    double factor = SlideShowFactors.of(context)?.factor ?? 0.0;

    // Calculate effective rotation angle based on the factor
    final effectiveRotationAngle = rotationAngle * factor;

    return Transform.rotate(
      angle: effectiveRotationAngle, // Rotate the widget based on the angle
      child: child,
    );
  }
}
