import 'package:administration_app/ui/res/assets.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/router.dart';
import 'package:administration_app/ui/screens/gsm_screen/gsm_screen_wm.dart';
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
        appBar: MediaQuery.of(context).orientation == Orientation.portrait ? AppBar(
          backgroundColor: blackColor,
          title: Text(
            'гсм'.toUpperCase(),
            style: const TextStyle(color: mainColor),
          ),
        ): null,
        body: AutoTabsScaffold(
          scaffoldKey: wm.scaffoldKey,
          routes: const [FuelConsumptionRoute(), TableFuelConsumptionRoute()],
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
                                Icons.query_stats,
                                color: whiteColor,
                              )),
                          activeIcon: Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Icon(
                                Icons.query_stats,
                                color: mainColor,
                              )),
                          label: 'Расход топлива',
                        ),
                        BottomNavigationBarItem(
                            icon: Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  Icons.train,
                                  color: whiteColor,
                                )),
                            activeIcon: Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Icon(
                                  Icons.train,
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
            ) : SizedBox();
          },
        ));
  }
}
