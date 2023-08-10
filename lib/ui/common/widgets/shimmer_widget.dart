import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

/// Виджет-скелетон
class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    double? width,
    double? height,
    double? radius,
    this.borderRadius,
    Key? key,
  })  : height = height ?? 14.0,
        width = width ?? double.infinity,
        radius = radius ?? 10.0,
        super(key: key);

  final double width;
  final double height;
  static const background = Color(0x030000000);
  static const shimmerColor = Color(0xFFFAFAFA);
  final double radius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    final res =
        MediaQuery.of(context).size.width > width || MediaQuery.of(context).size.height > height;
    return res
        ? Shimmer.fromColors(
      baseColor: background,
      highlightColor: shimmerColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: background,
          borderRadius: borderRadius ?? BorderRadius.circular(radius),
        ),
      ),
    )
        : Shimmer.fromColors(
      baseColor: background,
      highlightColor: shimmerColor,
      child: UnconstrainedBox(
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: background,
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
