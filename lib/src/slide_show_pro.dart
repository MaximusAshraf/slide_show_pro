import 'package:flutter/material.dart';
import 'package:slide_show_pro/src/factor_widget.dart';

class SlideShowProPage extends StatefulWidget {
  final List<Widget> children;
  final double viewportFraction;
  final bool infiniteScroll;
  final int initialPage;
  final int? itemsCount;
  final Widget Function(BuildContext, int)? itemBuilder;

  // Default constructor requires children
  const SlideShowProPage({
    super.key,
    required this.children,
    this.viewportFraction = 1,
    this.infiniteScroll = false,
    this.initialPage = 0,
  })  : itemBuilder = null,
        itemsCount = null;

  // Named constructor for using itemBuilder
  const SlideShowProPage.builder({
    super.key,
    required this.itemBuilder,
    required int this.itemsCount,
    this.infiniteScroll = false,
    this.viewportFraction = 1,
    this.initialPage = 0,
  }) : children = const [];

  @override
  State<SlideShowProPage> createState() => _SlideShowProPageState();
}

class _SlideShowProPageState extends State<SlideShowProPage> {
  late final PageController _controller;
  late final double rangeLimit;
  late final int _itemsCount;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    _itemsCount = widget.itemsCount ?? widget.children.length;
    final initialPage = widget.infiniteScroll
        ? (_itemsCount) * 100 + widget.initialPage
        : widget.initialPage;
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: initialPage,
    );
    rangeLimit = (1 / widget.viewportFraction).toInt() + 2;
    _scrollOffset = initialPage.toDouble();
    _controller.addListener(() {
      setState(() {
        _scrollOffset = _controller.page ?? initialPage.toDouble();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
      itemCount: widget.infiniteScroll ? null : _itemsCount,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        double factor = (index - _scrollOffset).clamp(-rangeLimit, rangeLimit);
        index = index % _itemsCount;

        final child = widget.itemBuilder != null
            ? widget.itemBuilder!(context, index)
            : widget.children[index];

        return SlideShowFactors(
          factor: factor,
          rangeLimit: rangeLimit,
          child: child,
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
