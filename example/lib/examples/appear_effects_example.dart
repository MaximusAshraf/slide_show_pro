import 'package:flutter/material.dart';
import 'package:slide_show_pro/slide_show_pro.dart';

class AppearEffectsExample extends StatelessWidget {
  const AppearEffectsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideShowProPage(
        children: [
          FadeEffect(
            child: Container(
              color: Colors.black12,
              child: const SlideAppear.fromRight(
                child: Center(
                  child: Text(
                    'Item 0',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          ScaleEffect(
            child: Container(
              color: Colors.black26,
              child: const SlideAppear.fromLeft(
                child: Center(
                  child: Text(
                    'Item 1',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          RotateEffect.fromLeft(
            child: Container(
              color: Colors.black12,
              child: const ScaleAppear(
                child: Center(
                  child: Text(
                    'Item 2',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          SlideEffect.fromLeft(
            child: Container(
              color: Colors.black26,
              child: const FadeAppear(
                child: Center(
                  child: Text(
                    'Item 3',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
