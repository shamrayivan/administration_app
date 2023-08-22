import 'package:administration_app/ui/res/assets.dart';
import 'package:administration_app/ui/screens/dummies_screen/empty_internet_error_screen_wm.dart';
import 'package:administration_app/ui/screens/splash_screen/splash_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class EmptyInternetErrorScreen extends CoreMwwmWidget {
  EmptyInternetErrorScreen({super.key}) : super(
  widgetModelBuilder: (_) => EmptyInternetErrorScreenWm(),
  );

  @override
  State<StatefulWidget> createState() => _EmptyInternetErrorScreenState();
}

class _EmptyInternetErrorScreenState extends WidgetState<EmptyInternetErrorScreenWm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Отсутствует подключение к интернету\nПожалуйста, проверьте WiFi или сотовую сеть', overflow: TextOverflow.ellipsis,),
            Image.asset(
              Assets.errorNoInternet,
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 24,),
            GestureDetector(onTap: (){
              wm.onRestart();
            },child: const Text('Попробовать снова', style: TextStyle(fontWeight: FontWeight.w600),))
          ],
        ),
      ),
    );
  }
}
