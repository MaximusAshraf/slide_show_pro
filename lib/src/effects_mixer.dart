import 'package:flutter/cupertino.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class EffectsBuilder extends StatelessWidget {
  final Widget child;

  /// add effect when widget entering the screen until it reaches the center
  final Widget Function(Widget child) enteringBuilder;

  /// add effect when widget leaving the screen until it disappears
  final Widget Function(Widget child) exitingBuilder;

  const EffectsBuilder(
      {super.key,
      required this.child,
      required this.enteringBuilder,
      required this.exitingBuilder});

  @override
  Widget build(BuildContext context) {
    // Access the factor from the FactorInheritedWidget
    double factor = SlideShowFactors.of(context)?.factor ?? 0.0;

    if (factor > 0) {
      return enteringBuilder(child);
    }

    return exitingBuilder(child);
  }
}
