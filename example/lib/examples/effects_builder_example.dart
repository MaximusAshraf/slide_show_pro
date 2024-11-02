import 'package:flutter/material.dart';
import 'package:slide_show_pro/slide_show_pro.dart';

class EffectsBuilderExample extends StatelessWidget {
  const EffectsBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SlideShowProPage(
      children: [
        EffectsBuilder(
          child: const Placeholder(),
          enteringBuilder: (child) {
            return child;
          },
          exitingBuilder: (child) {
            return FixedPositionEffect.vertical(child: child);
          },
        ),
        EffectsBuilder(
          child: const Placeholder(),
          enteringBuilder: (child) {
            return const FadeEffect(child: Placeholder());
          },
          exitingBuilder: (child) {
            return SlideEffect.fromLeft(child: child);
          },
        ),
      ],
    );
  }
}
