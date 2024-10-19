import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class ScaleAppear extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;

  const ScaleAppear({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 400),
  });

  @override
  State<ScaleAppear> createState() => _ScaleAppearState();
}

class _ScaleAppearState extends State<ScaleAppear>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
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
      duration: widget.duration, // Set the animation duration
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: widget.child,
    );
  }
}
