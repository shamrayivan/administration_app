import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class DefaultButton<T> extends StatelessWidget {
  final Action<T>? onPressed;
  final VoidCallback? onCallback;
  final T? data;
  final double? height;
  final double? maximumWidth;
  final double? minimumWidth;
  final String? text;
  final Widget? child;
  final Color? bgColor;
  final List<Color>? gradient;
  final List<Color>? gradientDisabled;
  final Color? colorBorderSide;
  final Color? splashColor;
  final Color? textColor;
  final Color? disabledColor;
  final Color? highlightColor;
  final Color? textColorDisabled;
  final bool enabled;
  final bool isShadow;
  final List<double>? borderRadii;
  final EdgeInsetsGeometry padding;
  final TextDecoration? decoration;
  final TextStyle? style;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double borderWidth;

  const DefaultButton({
    this.height,
    this.onPressed,
    this.onCallback,
    this.bgColor,
    this.maximumWidth,
    this.minimumWidth,
    this.text,
    this.data,
    this.colorBorderSide,
    this.splashColor,
    this.textColorDisabled,
    this.gradientDisabled,
    this.textColor,
    this.gradient,
    this.child,
    this.disabledColor,
    this.highlightColor,
    this.enabled = true,
    this.isShadow = false,
    this.borderRadii,
    this.padding = const EdgeInsets.all(0),
    Key? key,
    this.decoration,
    this.style,
    this.fontFamily,
    this.fontSize,
    this.fontWeight, this.borderWidth = 2,
  })  : assert(onPressed == null && onCallback == null ||
      onPressed == null && onCallback != null ||
      onPressed != null && onCallback == null),
        assert(text == null && child != null || text != null && child == null),
        super(key: key);

  const DefaultButton.changeButton({
    required this.height, this.onPressed,
    this.onCallback,
    this.data,
    this.maximumWidth,
    this.minimumWidth,
    this.text,
    this.child,
    this.bgColor = Colors.transparent,
    this.gradient,
    this.gradientDisabled,
    this.colorBorderSide,
    this.splashColor,
    this.textColor,
    this.disabledColor,
    this.highlightColor,
    this.textColorDisabled,
    this.enabled = true,
    this.isShadow = false,
    this.borderRadii = const [0, 0, 0, 0],
    this.padding = const EdgeInsets.all(0),
    this.decoration,
    this.style,
    Key? key,
    this.fontFamily,
    this.fontSize,
    this.fontWeight, this.borderWidth = 2,
  }): assert(onPressed == null && onCallback == null ||
      onPressed == null && onCallback != null ||
      onPressed != null && onCallback == null),
        assert(text == null && child != null || text != null && child == null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: enabled ? bgColor : disabledColor,
        border: Border.all(
          color: colorBorderSide ?? Colors.transparent,
          width: borderWidth,
        ),
        boxShadow: [
        ],
      ),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          maximumSize: Size(maximumWidth ?? double.infinity, height ?? double.infinity),
          minimumSize: Size(minimumWidth ?? maximumWidth ?? double.infinity, height ?? 0),
          backgroundColor: Colors.transparent,
          disabledBackgroundColor: disabledColor ?? Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          side: BorderSide.none,
          padding: padding,
          shape: RoundedRectangleBorder(

          ),
        ),
        onPressed: enabled
            ? onCallback != null
            ? onCallback?.call
            : () => onPressed?.accept(data)
            : null,
        child: text != null
            ? Text(
          text!,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.apply(
            decoration: decoration,
            color: enabled
                ? (textColor ?? mainColor)
                : textColorDisabled ?? greyColor,
          )
              .copyWith(fontFamily: fontFamily, fontSize: fontSize, fontWeight: fontWeight),
        )
            : child!,
      ),
    );
  }
}
