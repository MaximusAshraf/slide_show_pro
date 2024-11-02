
Slide Show Pro is a powerful Flutter package designed to simplify the creation of animated sliders. With Slide Show Pro, you can seamlessly integrate various animation effects such as **fade**, **scale**, **slide**, and **rotate** into your projects.

Whether you're building an image gallery, a product showcase, or any feature that requires smooth and engaging animations, Slide Show Pro makes it easy to achieve professional-grade results with minimal effort.

## Features

- **Multiple Animation Effects**: Easily apply different animations, including:
    - **Fade**: Smoothly transitions between images by fading in and out.
    - **Scale**: Create a zoom effect that can enhance visual engagement.
    - **Slide**: Transition images by sliding them in and out of view.
    - **Rotate**: Add a spinning effect to your images for a dynamic display.
- **Mix and Match**: Combine different effects to create stunning and dynamic transitions.
- **Customizable**: Adjust various parameters to fit your specific needs.
- **User-Friendly**: Achieve professional-grade results with minimal effort.

## Usage

Let’s take a look at how to use `SlideShowProPage` with different animation effects.

### Initial Start with Effects

```dart
const SlideShowProPage(
  children: [
    FadeEffect(child: Placeholder()),
    ScaleEffect(child: Placeholder()),
    RotateEffect.fromLeft(child: Placeholder()),
    SlideEffect.fromLeft(child: Placeholder()),
  ],
)
```

## SlideShowPro Effects List

The following effects can be used within `SlideShowPro` to add animations to your slides:

## Effects

- **`FadeEffect`**  
  Adds a fading transition to your slides.

- **`ScaleEffect`**  
  Adds a scaling transition to your slides.

- **`RotateEffect`**  
  Enables rotational animation, with options to specify the direction using named constructors:
  - `RotateEffect.fromLeft`
  - `RotateEffect.fromRight`

- **`SlideEffect`**  
  Allows sliding animations from different directions, selectable via named constructors:
  - `SlideEffect.fromLeft`
  - `SlideEffect.fromRight`
  - `SlideEffect.fromTop`
  - `SlideEffect.fromBottom`

- **`FixedPositionEffect`**  
  Fixes the slide in a set position, with options for direction using named constructors:
  - `FixedPositionEffect.vertical`
  - `FixedPositionEffect.horizontal`

### SlideShowProPage builder

if you want to create a slider with a large number of items, with the same effect, you can use the `SlideShowProPage.builder` method.

```dart
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
```

### EffectsBuilder

with `EffectsBuilder` you can customize entering and exiting effects.

```dart
SlideShowProPage(
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
    )
```

### Appear Effects

If you want to show an item content if widget centered, you can use `Appear` effects.
like `FadeAppear`, `ScaleAppear`, `SlideAppear`.
for `SlideAppear` use named constructor to set the direction of the slide.
like `SlideAppear.fromLeft`, `SlideAppear.fromRight`, `SlideAppear.fromTop`, `SlideAppear.fromBottom`.

```dart
Widget build(BuildContext context) {
  return Scaffold(
    body: SlideShowProPage(
      children: [
        RotateEffect.fromLeft(
          child: Container(
            color: Colors.black12,
            child: const ScaleAppear(
              child: Center(
                child: Text(
                  'Item 1',
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
                  'Item 2',
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
```