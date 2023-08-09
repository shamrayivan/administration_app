import 'package:administration_app/ui/res/assets.dart';
import 'package:administration_app/ui/screens/gsm_screen/gsm_screen_wm.dart';
import 'package:administration_app/ui/screens/splash_screen/splash_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class GSMScreen extends CoreMwwmWidget {
  GSMScreen() : super(
    widgetModelBuilder: (_) => GSMScreenWM(),
  );

  @override
  State<StatefulWidget> createState() => _GSMScreenState();
}

class _GSMScreenState extends WidgetState<GSMScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.logo,
          height: 200,
          width: 200,
        ),
      ),
    );
  }
}
