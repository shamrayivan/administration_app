import 'package:administration_app/ui/res/assets.dart';
import 'package:administration_app/ui/screens/splash_screen/splash_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class SplashScreen extends CoreMwwmWidget {
  SplashScreen() : super(
    widgetModelBuilder: (_) => SplashScreenWm(),
  );

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends WidgetState<SplashScreenWm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo,
              height: 200,
              width: 200,
            ),
            SizedBox(height: 24,),
            StreamedStateBuilderNS(
              streamedStateNS: wm.errorState,
              builder: (context, error) {
                return error ? GestureDetector(onTap: (){
                  wm.onInit();
                },child: Text('Попробовать снова', style: TextStyle(fontWeight: FontWeight.w600),)) : SizedBox();
              }
            )
          ],
        ),
      ),
    );
  }
}
