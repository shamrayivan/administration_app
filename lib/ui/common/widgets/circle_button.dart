import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class CircleButton<T> extends StatelessWidget {
  const CircleButton({
    this.onPressed,
    this.data,
    this.onCallback,
    this.iconColor,
    this.bodyColor,
    this.backGroundColor,
    this.gradient,
    this.isGradient = false,
    this.enabled = true,
    IconData? iconData,
    this.iconWidget,
    Size? size,
    this.iconSize,
    this.color,
    Key? key, this.boxShadow,
  })  : size = size ?? const Size(32, 32),
        iconData = iconData ?? Icons.arrow_back_ios,
        super(key: key);

  final Action<T?>? onPressed;
  final VoidCallback? onCallback;
  final T? data;
  final bool enabled;
  final bool isGradient;

  final Color? color;
  final Color? iconColor;
  final Color? bodyColor;
  final Color? backGroundColor;
  final List<Color>? gradient;

  final List<BoxShadow>? boxShadow;

  final IconData iconData;

  final Size size;
  final double? iconSize;

  final Widget? iconWidget;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isGradient ? null : color ?? Colors.transparent,
        boxShadow: boxShadow,
      ),
      child: MaterialButton(
        onPressed: () => onCallback != null ? onCallback!.call() : onPressed?.accept(data),
        elevation: 0,
        disabledElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        padding: const EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        height: size.height,
        minWidth: size.width,
        shape: const CircleBorder(),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            iconWidget ??
                CustomPaint(
                  painter: _CirclePainter(
                    size: Size(size.width, size.height),
                    color: bodyColor ?? Colors.black,
                  ),
                  child: Icon(
                    iconData,
                    color: iconColor ?? mainColor,
                    size: iconSize ?? 20,
                  ),
                )
          ],
        ),
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final Size size;
  final Color color;
  final _paint = Paint();

  _CirclePainter({
    required this.size,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _paint.color = color;
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
