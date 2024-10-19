import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class SlideShowProPage extends StatefulWidget {
  final List<Widget> children;

  const SlideShowProPage({super.key, required this.children});

  @override
  State<SlideShowProPage> createState() => _SlideShowProPageState();
}

class _SlideShowProPageState extends State<SlideShowProPage> {
  late final PageController _controller;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        _scrollOffset = _controller.page ?? 0.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.children.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        // Calculate the factor based on scroll position
        double factor = (index - _scrollOffset).clamp(-1.0, 1.0);
        return FactorInheritedWidget(
          factor: factor,
          child: widget.children[index],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
