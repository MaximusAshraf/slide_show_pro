import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class SlideShowProPage extends StatefulWidget {
  final List<Widget> children;
  final double viewportFraction;
  final bool infiniteScroll;
  final int initialPage;

  const SlideShowProPage({
    super.key,
    required this.children,
    this.viewportFraction = 1,
    this.infiniteScroll = false,
    this.initialPage = 0,
  });

  @override
  State<SlideShowProPage> createState() => _SlideShowProPageState();
}

class _SlideShowProPageState extends State<SlideShowProPage> {
  late final PageController _controller;

  /// max and min range of the factor
  late final double rangeLimit;

  double _scrollOffset = 0.0;

  @override
  void initState() {
    final initialPage = widget.infiniteScroll
        ? widget.children.length * 1000 + widget.initialPage
        : widget.initialPage;
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: initialPage,
    );
    rangeLimit = (1 / widget.viewportFraction).toInt() + 2;
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
      itemCount: widget.infiniteScroll ? null : widget.children.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        index = index % widget.children.length;
        // Calculate the factor based on scroll position
        double factor = (index - _scrollOffset).clamp(-rangeLimit, rangeLimit);
        return SlideShowFactors(
          factor: factor,
          rangeLimit: rangeLimit,
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
