import 'package:flutter/material.dart';
import 'package:slide_show_pro/slide_show_pro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Slide Show Pro',
      debugShowCheckedModeBanner: false,
      home: ExamplePage(),
      //home: InitStart(),
      //home: EffectsBuilderExample(),
      //home: BuilderExample(),
      //home: AppearEffectsExample(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slide Show Pro Example')),
      body: SlideShowProPage(
        infiniteScroll: true,
        initialPage: 0,
        //viewportFraction: 0.6,
        children: [
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_0.jpg',
              shortDescription: 'Slide 1: Fade left',
              alignment: Alignment.centerLeft,
            ),
            enteringBuilder: (child) {
              return child;
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_1.jpg',
              shortDescription: 'Slide 2: Fade left',
              alignment: Alignment.centerLeft,
            ),
            enteringBuilder: (child) {
              return FadeEffect(child: child);
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const SlideTopSlide(
              backgroundImage: 'assets/background_2.jpg',
              shortDescription: 'Slide 3: Slide left',
              alignment: Alignment.centerLeft,
            ),
            enteringBuilder: (child) {
              return SlideEffect.fromLeft(child: child);
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const SlideBottomSlide(
              backgroundImage: 'assets/background_3.jpg',
              shortDescription: 'Slide 4: Slide right',
              alignment: Alignment.centerRight,
            ),
            enteringBuilder: (child) {
              return SlideEffect.fromRight(child: child);
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_4.jpg',
              shortDescription: 'Slide 5: Fade right',
              alignment: Alignment.centerRight,
            ),
            enteringBuilder: (child) {
              return ScaleEffect(child: child);
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_0.jpg',
              shortDescription: 'Slide 6: Slide top',
              alignment: Alignment.centerLeft,
            ),
            enteringBuilder: (child) {
              return SlideEffect.reverseVertical(child: child);
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_1.jpg',
              shortDescription: 'Slide 7: Slide bottom',
              alignment: Alignment.centerRight,
            ),
            enteringBuilder: (child) {
              return child;
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_2.jpg',
              shortDescription: 'Slide 8: Rotate left',
              alignment: Alignment.centerRight,
            ),
            enteringBuilder: (child) {
              return RotateEffect.fromLeft(child: child);
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_3.jpg',
              shortDescription: 'Slide 9: Rotate right',
              alignment: Alignment.centerRight,
            ),
            enteringBuilder: (child) {
              return RotateEffect.fromRight(child: child);
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_4.jpg',
              shortDescription: 'Slide 10: Rotate left',
              alignment: Alignment.centerRight,
            ),
            enteringBuilder: (child) {
              return SlideEffect.reverseHorizontal(
                  child: RotateEffect.fromLeft(child: child));
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
          EffectsBuilder(
            child: const FadeSlide(
              backgroundImage: 'assets/background_2.jpg',
              shortDescription: 'Slide 11: Rotate right',
              alignment: Alignment.centerRight,
            ),
            enteringBuilder: (child) {
              return SlideEffect.reverseVertical(
                  child: RotateEffect.fromRight(child: child));
            },
            exitingBuilder: (child) {
              return FixedPositionEffect.vertical(child: child);
            },
          ),
        ],
      ),
    );
  }
}

class FadeSlide extends StatelessWidget {
  final String backgroundImage;
  final String shortDescription;
  final Alignment alignment;
  const FadeSlide(
      {super.key,
      required this.backgroundImage,
      required this.shortDescription,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: FadeAppear(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          //delay: const Duration(milliseconds: 300),
          // split shortDescription into words
          children: shortDescription.split(' ').map((word) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(word,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ScaleSlide extends StatelessWidget {
  final String backgroundImage;
  final String shortDescription;
  final Alignment alignment;
  const ScaleSlide(
      {super.key,
      required this.backgroundImage,
      required this.shortDescription,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: ScaleAppear(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          //delay: const Duration(milliseconds: 300),
          // split shortDescription into words
          children: shortDescription.split(' ').map((word) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(word,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SlideBottomSlide extends StatelessWidget {
  final String backgroundImage;
  final String shortDescription;
  final Alignment alignment;
  const SlideBottomSlide(
      {super.key,
      required this.backgroundImage,
      required this.shortDescription,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SlideAppear.fromBottom(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          //delay: const Duration(milliseconds: 300),
          // split shortDescription into words
          children: shortDescription.split(' ').map((word) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(word,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      )),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class SlideTopSlide extends StatelessWidget {
  final String backgroundImage;
  final String shortDescription;
  final Alignment alignment;
  const SlideTopSlide(
      {super.key,
      required this.backgroundImage,
      required this.shortDescription,
      required this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: SlideAppear.fromTop(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          //delay: const Duration(milliseconds: 300),
          // split shortDescription into words
          children: shortDescription.split(' ').map((word) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(word,
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Colors.white,
                      )),
            );
          }).toList(),
        ),
      ),
    );
  }
}
