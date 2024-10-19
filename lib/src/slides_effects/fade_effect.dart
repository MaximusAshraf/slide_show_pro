import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class FadeEffect extends StatelessWidget {
  final Widget child;

  const FadeEffect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Access the factor from the FactorInheritedWidget
    double factor = FactorInheritedWidget.of(context)?.factor ?? 0.0;

    // Calculate the opacity based on the factor (e.g., from 0 to 1)
    double opacity = 1 - factor.abs();

    return Opacity(
      opacity: opacity.clamp(0.0, 1.0), // Ensure the opacity is between 0 and 1
      child: child,
    );
  }
}
