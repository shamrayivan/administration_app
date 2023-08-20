import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/router.dart';
import 'package:administration_app/ui/screens/gsm_screen/gsm_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

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
        resizeToAvoidBottomInset: false,
        appBar: MediaQuery.of(context).orientation == Orientation.portrait ? AppBar(
          backgroundColor: blackColor,
          actions: [
            StreamedStateBuilderNS(streamedStateNS: wm.currentBottomBarIndexState, builder: (context, index){
              return index == 1 ? Column(
                children: [
                  StreamedStateBuilderNS(
                    streamedStateNS: wm.hideRetiredState,
                    builder: (context, hideRetired) {
                      return Transform.scale(
                        scale: 0.75,
                        child: CupertinoSwitch(
                            trackColor: Colors.grey,
                            activeColor: CupertinoColors.activeGreen,
                            value: hideRetired,
                            onChanged: (value) {
                                wm.hideRetiredState.accept(value);
                            }),
                      );
                    }
                  ),
                  const Text(
                    "скрыть выбывшие",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ) : const SizedBox();})
            ],
          title: Text(
            'гсм'.toUpperCase(),
            style: const TextStyle(color: mainColor),
          ),
        ): null,
        body: AutoTabsScaffold(
          scaffoldKey: wm.scaffoldKey,
          routes:  [FuelConsumptionRoute(), TableFuelConsumptionRoute()],
          transitionBuilder: (context, child, animation) => FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBuilder: (_, tabsRouter) {
            return MediaQuery.of(context).orientation == Orientation.portrait ? Container(
              color: blackColor,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 5,
                      )
                    ]),
                    child: BottomNavigationBar(
                      unselectedItemColor: Colors.white,
                      selectedItemColor: mainColor,
                      backgroundColor: blackColor,
                      items: const [
                        BottomNavigationBarItem(
                          icon: Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                Icons.oil_barrel,
                                color: whiteColor,
                              )),
                          activeIcon: Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                Icons.oil_barrel,
                                color: mainColor,
                              )),
                          label: 'Расход топлива',
                        ),
                        BottomNavigationBarItem(
                            icon: Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  Icons.table_chart,
                                  color: whiteColor,
                                )),
                            activeIcon: Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  Icons.table_chart,
                                  color: mainColor,
                                )),
                            label: 'Таблица расхода'),
                      ],
                      currentIndex: tabsRouter.activeIndex,
                      onTap: (int) {
                        tabsRouter.setActiveIndex(int);
                        wm.onChooseBottomBarIndex.accept(int);
                      },
                    ),
                  ),
                ),
              ),
            ) : const SizedBox();
          },
        ));
  }
}
