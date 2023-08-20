import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/choose_treatment_screen/settings_screen/settings_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class SettingsScreen extends CoreMwwmWidget {
  SettingsScreen()
      : super(
    widgetModelBuilder: (_) => SettingsScreenWm(),
  );

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends WidgetState<SettingsScreenWm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'настройки'.toUpperCase(),
          style: const TextStyle(color: Colors.amberAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Center(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){
              wm.onResetAccount();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 51,
              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20),),color: blackColor),
              child: const Center(child: Text('Выйти из аккаунта', style: TextStyle(color: mainColor),)),),
          )
        ),),
      ),
    );
  }
}
