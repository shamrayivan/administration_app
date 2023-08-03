import 'package:flutter/material.dart';

const double defRadius = 16;

class ContainerShadow extends StatelessWidget {
  final Widget child;
  final double radius;
  final double offsetX;
  final double? height;
  final double? width;
  final double? offset;
  final Color? borderColor;
  final Color? color;
  final List<Color>? bgGradient;
  final bool isBoxShadow;
  final List<double>? borderRadius;

  const ContainerShadow({
  required this.child,
  this.borderRadius,
  double? radius,
  double? offsetX,
  this.height,
  this.borderColor,
  this.color,
  this.offset,
  this.bgGradient,
  this.width,
  this.isBoxShadow = true,
  super.key,
})  : radius = radius ?? defRadius,
offsetX = offsetX ?? 2;

@override
Widget build(BuildContext context) {
  return LayoutBuilder(
    builder: (_, BoxConstraints constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: height == null ? 0 : height!,
          minWidth: width ?? 0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: bgGradient == null ? color ?? Colors.white : null,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: [
              if (isBoxShadow)
                BoxShadow(
                  color: borderColor ?? Colors.black,
                  blurRadius: 1,
                  offset: Offset(0, offset ?? 0),
                ),
            ],
            gradient: bgGradient == null ? null : LinearGradient(colors: bgGradient!),
            border: borderColor == null ? null : Border.all(color: borderColor!),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            child: child,
          ),
        ),
      );
    },
  );
}
}
