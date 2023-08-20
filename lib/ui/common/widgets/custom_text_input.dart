import 'package:administration_app/utils/collection_reg_exp.dart';
import 'package:administration_app/utils/double_formatter.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool enabled;
  final bool expands;
  final bool isDouble;
  final bool isForm;
  final bool? autoFocus;
  final String? hintText;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? errorBorderColor;
  final Color? hintColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final int maxLines;
  final int minLines;
  final TextInputType keyboardType;
  final TextAlignVertical textAlignVertical;
  final FocusNode? focusNode;
  final int? maxLength;
  final Validator<String?>? validator;
  final TextInputAction textInputAction;
  final Widget? icon;
  final double? height;
  final double? width;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  final Function()? onTap;
  final InputBorder? externalBorder;
  final InputBorder? externalErrorBorder;
  final FontWeight? fontWeigth;
  final double? fontSize;
  final String? fontFamily;
  final bool? obscure;

  const CustomTextField({
  required this.controller,
  required this.enabled,
  this.expands = false,
  this.suffixIcon,
  this.isDouble = false,
  this.isForm = false,
  this.fillColor,
  this.textColor,
  this.borderColor,
  this.hintColor,
  this.errorBorderColor,
  this.hintText,
  this.errorText,
  this.maxLines = 1,
  this.verticalPadding = 1,
  this.textAlignVertical = TextAlignVertical.center,
  this.keyboardType = TextInputType.text,
  this.focusNode,
  this.maxLength,
  this.validator,
  this.textInputAction = TextInputAction.done,
  super.key,
  this.icon,
  this.height,
  this.width,
  this.hintStyle,
  this.horizontalPadding,
  this.textAlign,
  this.autoFocus,
  this.onChanged,
  this.externalBorder,
  this.externalErrorBorder,
  this.prefixIcon,
  this.onTap,
  this.fontWeigth,
  this.fontSize,
  this.fontFamily, this.minLines = 1, this.obscure,
});

@override
Widget build(BuildContext context) {
  return isForm
      ? TextFormField(
    obscureText: obscure ?? false,
    onChanged: onChanged,
    cursorColor: const Color(0xFF7B61FF),
    autofocus: autoFocus ?? false,
    textAlign: textAlign ?? TextAlign.start,
    focusNode: focusNode,
    expands: expands,
    enabled: enabled,
    controller: controller,
    maxLength: maxLength,
    textAlignVertical: textAlignVertical,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    maxLines: expands ? null : maxLines,
    minLines: minLines,
    validator: validator == null ? null : (val) => validator!(val) ? null : '',
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: textColor,
        fontWeight: fontWeigth,
        fontSize: fontSize,
        fontFamily: fontFamily),
    inputFormatters: isDouble
        ? [
      DoubleFormatter(),
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
    ]
        : null,
    buildCounter: (
        BuildContext context, {
          required int currentLength,
          required int? maxLength,
          required bool isFocused,
        }) =>
    null,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      icon: icon,
      errorText: errorText,
      errorStyle: errorText == null
          ? const TextStyle(height: 0)
          : Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red),
      // constraints: errorText == null
      //     ? BoxConstraints.expand(width: width, height: height)
      //     : null,
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle:
      hintStyle ?? TextStyle(color: hintColor),
      disabledBorder: externalBorder ?? border,
      errorBorder: externalErrorBorder ?? errorBorder,
      focusedBorder: externalBorder ?? border,
      enabledBorder: externalBorder ?? border,
      border: border,
      fillColor: fillColor ?? Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 12, vertical: verticalPadding ?? 0),
    ),
  )
      : TextField(
    obscureText: obscure ?? false,
    onTap: onTap,
    onChanged: onChanged,
    textAlign: textAlign ?? TextAlign.start,
    autofocus: autoFocus ?? false,
    cursorColor: const Color(0xFF7B61FF),
    focusNode: focusNode,
    expands: expands,
    enabled: enabled,
    controller: controller,
    maxLength: maxLength,
    textAlignVertical: textAlignVertical,
    textInputAction: textInputAction,
    keyboardType: keyboardType,
    maxLines: expands ? null : maxLines,
    minLines: minLines,
    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: textColor,
        fontWeight: fontWeigth,
        fontSize: fontSize,
        fontFamily: fontFamily),
    inputFormatters: isDouble
        ? [
      DoubleFormatter(),
      FilteringTextInputFormatter.allow(RegExp(r'(^\d*\.?\d*)')),
    ]
        : null,
    buildCounter: (
        BuildContext context, {
          required int currentLength,
          required int? maxLength,
          required bool isFocused,
        }) =>
    null,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      icon: icon,
      errorMaxLines: 1,
      errorText: errorText,
      errorStyle: errorText == null
          ? const TextStyle(height: 0)
          : Theme.of(context).textTheme.bodyMedium,
      constraints: errorText == null
          ? BoxConstraints.expand(width: width, height: height ?? 51)
          : null,
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: hintStyle ??
          Theme.of(context)
              .textTheme
              .labelLarge
              ?.copyWith(color: hintColor, fontFamily: 'Poppins'),
      border: externalBorder ?? border,
      enabledBorder: externalBorder ?? border,
      disabledBorder: externalBorder ?? border,
      errorBorder: externalErrorBorder ?? errorBorder,
      focusedBorder: externalBorder ?? border,
      fillColor: fillColor ?? Colors.white,
      filled: true,
      contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 12, vertical: verticalPadding ?? 0),
    ),
  );
}

InputBorder get border => OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(color: borderColor ?? Colors.white),
);

InputBorder get errorBorder => OutlineInputBorder(
  borderRadius: BorderRadius.circular(10.0),
  borderSide: BorderSide(color: errorBorderColor ?? Colors.red),
);
}
