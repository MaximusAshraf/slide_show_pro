import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class SlideAppear extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Offset beginOffset;

  const SlideAppear.fromLeft({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
  }) : beginOffset = const Offset(-1.0, 0.0); // Slide from left

  const SlideAppear.fromRight({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
  }) : beginOffset = const Offset(1.0, 0.0); // Slide from right

  const SlideAppear.fromTop({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
  }) : beginOffset = const Offset(0.0, -1.0); // Slide from top

  const SlideAppear.fromBottom({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
  }) : beginOffset = const Offset(0.0, 1.0); // Slide from bottom

  @override
  State<SlideAppear> createState() => _SlideAppearState();
}

class _SlideAppearState extends State<SlideAppear>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  double factor = 0.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Access the factor from the FactorInheritedWidget
    factor = FactorInheritedWidget.of(context)?.factor ?? 0.0;

    // Update the animation based on the factor
    if (factor >= 0) {
      Future.delayed(widget.delay).then((_) {
        if (mounted) _controller.forward();
      });
    } else {
      _controller.reverse();
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animation = Tween<Offset>(begin: widget.beginOffset, end: Offset.zero)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: widget.child,
    );
  }
}
