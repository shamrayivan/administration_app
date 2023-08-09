import 'package:flutter/material.dart';

class AdaptiveScrollView extends StatelessWidget {
  const AdaptiveScrollView({
    required this.child,
    this.controller,
    this.scrollPhysics,
    this.horizontalPadding,
    this.maxHeight,
    this.isScrolled = true,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final ScrollController? controller;
  final ScrollPhysics? scrollPhysics;
  final double? horizontalPadding;
  final double? maxHeight;
  final bool isScrolled;

  @override
  Widget build(BuildContext context) {
    return isScrolled
        ? LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return SingleChildScrollView(
          controller: controller,
          physics: scrollPhysics,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 0),
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              minHeight: constraints.maxHeight,
              maxHeight: maxHeight ?? double.infinity,
            ),
            child: child,
          ),
        );
      },
    )
        : LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        return ConstrainedBox(
          constraints: constraints.copyWith(
            minHeight: constraints.minHeight,
            maxHeight: constraints.maxHeight,
          ),
          child: child,
        );
      },
    );
  }
}
