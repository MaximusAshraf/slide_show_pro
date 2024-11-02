import 'package:flutter/material.dart';
import 'package:slide_show_pro/slide_show_pro.dart';

class BuilderExample extends StatelessWidget {
  const BuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideShowProPage.builder(
        itemsCount: 10,
        infiniteScroll: true,
        itemBuilder: (context, index) {
          return EffectsBuilder(
            child: Container(color: Colors.grey, child: const Placeholder()),
            enteringBuilder: (child) {
              return FadeEffect(child: child);
            },
            exitingBuilder: (child) {
              return SlideEffect.fromLeft(child: child);
            },
          );
        },
      ),
    );
  }
}
