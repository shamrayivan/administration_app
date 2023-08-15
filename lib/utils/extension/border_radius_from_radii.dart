import 'package:flutter/widgets.dart';

BorderRadius fromRadius(List<double> radii) {
  assert(radii.length == 4);
  return BorderRadius.only(
    topLeft: Radius.circular(radii[0]),
    topRight: Radius.circular(radii[1]),
    bottomLeft: Radius.circular(radii[2]),
    bottomRight: Radius.circular(radii[3]),
  );
}

EdgeInsets fromPadding(List<double> padding) {
  assert(padding.length == 4);
  return EdgeInsets.only(
    left: padding[0],
    top: padding[1],
    right: padding[2],
    bottom: padding[3],
  );
}
