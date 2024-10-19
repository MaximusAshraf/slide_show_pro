import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class FadeEffect extends StatelessWidget {
  final Widget child;

  const FadeEffect({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final double factor = SlideShowFactors.of(context)?.factor ?? 0.0;
    final double rangeLimit = SlideShowFactors.of(context)?.rangeLimit ?? 1.0;

    // Calculate the opacity based on the factor and rangeLimit
    final double opacity = 1 - (factor / rangeLimit).abs();

    return Opacity(
      opacity: opacity.clamp(0.0, 1.0), // Ensure the opacity is between 0 and 1
      child: child,
    );
  }
}
