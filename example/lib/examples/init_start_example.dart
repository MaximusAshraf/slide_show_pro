import 'package:flutter/material.dart';
import 'package:slide_show_pro/slide_show_pro.dart';

class InitStart extends StatelessWidget {
  const InitStart({super.key});

  @override
  Widget build(BuildContext context) {
    return const SlideShowProPage(
      children: [
        FadeEffect(child: Placeholder()),
        ScaleEffect(child: Placeholder()),
        RotateEffect.fromLeft(child: Placeholder()),
        SlideEffect.fromLeft(child: Placeholder()),
      ],
    );
  }
}
