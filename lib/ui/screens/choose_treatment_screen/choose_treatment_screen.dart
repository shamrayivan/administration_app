import 'package:administration_app/ui/screens/choose_treatment_screen/choose_treatment_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class ChooseTreatmentScreen extends CoreMwwmWidget {
  ChooseTreatmentScreen()
      : super(
          widgetModelBuilder: (_) => ChooseTreatmentScreenWm(),
        );

  @override
  State<StatefulWidget> createState() => _ChooseTreatmentScreenState();
}

class _ChooseTreatmentScreenState extends WidgetState<ChooseTreatmentScreenWm> {
  @override
  Widget build(BuildContext context) {
    final mediaQuerry = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Инфинити групп'.toUpperCase(),
          style: const TextStyle(color: Colors.amberAccent),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Выберите обработку',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: (){
                    wm.onGSM();
                  },
                  child: Container(
                    height: mediaQuerry.width / 3,
                    width: mediaQuerry.width / 3,
                    decoration: const BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'ГСМ',
                          style: TextStyle(
                              color: Colors.amberAccent, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.oil_barrel,
                          color: Colors.amberAccent,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    wm.onTransport();
                  },
                  child: Container(
                    height: mediaQuerry.width / 3,
                    width: mediaQuerry.width / 3,
                    decoration: const BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Транспорт',
                          style: TextStyle(
                              color: Colors.amberAccent, fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.directions_bus,
                          color: Colors.amberAccent,
                          size: 32,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
