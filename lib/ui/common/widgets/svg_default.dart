import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgDefault extends StatelessWidget {
  final String? path;
  final String? url;
  final Color color;
  final double height;
  final double width;
  final Widget Function(BuildContext)? placeHolderBuilder;

  const SvgDefault._(this.path,
      this.url,
      this.color,
      this.height, this.width,
      this.placeHolderBuilder,
      Key? key,)
      : assert(path != url),
        super(key: key);

  factory SvgDefault.def({
    String? path,
    String? url,
    Color? color,
    double? height,
    double? width,
    Widget Function(BuildContext)? placeHolderBuilder,
    Key? key,
  }) {
    return SvgDefault._(
      path,
      url,
      color ?? Colors.grey,
      height ?? 26,
      width ?? 26,
      placeHolderBuilder,
      key,
    );
  }

  factory SvgDefault.red({
    String? path,
    String? url,
    Color? color,
    Key? key,
    double? height,
    double? width,
    Widget Function(BuildContext)? placeHolderBuilder,
  }) {
    return SvgDefault._(path, url, color ?? Colors.red, height ?? 26, width ?? 26, placeHolderBuilder, key,);
  }

  @override
  Widget build(BuildContext context) {
    if (path != null) {
      return SvgPicture.asset(path!, height: height,
          width: width,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn));
    } else if (url != null) {
      return SvgPicture.network(url!, height: height,
          width: width,
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          placeholderBuilder: placeHolderBuilder);
    }
    return const SizedBox.shrink();
  }
}
