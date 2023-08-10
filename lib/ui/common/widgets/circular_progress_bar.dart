import 'package:flutter/material.dart';

class CircullarProgressBar extends StatelessWidget {
  final Color? backgroundColor;
  final double? value;
  const CircullarProgressBar({super.key, this.backgroundColor, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? const Color(0xFF000000).withOpacity(0.5),
      child: Center(
        child:
        CircularProgressIndicator(
          value: value,
          backgroundColor: Colors.amberAccent,
          color: Colors.black,
        ),
      ),
    );
  }
}
