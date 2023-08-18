import 'package:administration_app/ui/common/widgets/adaptive_scroll_view.dart';
import 'package:administration_app/ui/common/widgets/chart/chart.dart';
import 'package:administration_app/ui/common/widgets/choose_period_date.dart';
import 'package:administration_app/ui/common/widgets/choose_vehicle_or_driver.dart';
import 'package:administration_app/ui/common/widgets/circular_progress_bar.dart';
import 'package:administration_app/ui/common/widgets/toggle_button.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/gsm_screen/fuel_consumption_screen/fuel_consumption_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:intl/intl.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class FuelConsumptionScreen extends CoreMwwmWidget {
  FuelConsumptionScreen()
      : super(
          widgetModelBuilder: (_) => FuelConsumptionScreenWM(),
        );

  @override
  State<StatefulWidget> createState() => _FuelConsumptionScreenState();
}

class _FuelConsumptionScreenState extends WidgetState<FuelConsumptionScreenWM> {
  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilderNS(
        streamedStateNS: wm.currentToggle,
        builder: (context, currentToggle) {
          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ToggleButton(
                        selectedToggle: wm.selectedToggle,
                        toggleWidgets: wm.toggleWidgets,
                        onChangeToggle: wm.onChangeToggle),
                    currentToggle == 0
                        ? StreamedStateBuilderNS(
                            streamedStateNS: wm.choosenVehicleOrder,
                            builder: (context, choosenVehicle) {
                              return GestureDetector(
                                  onTap: () {
                                    wm.onChooseVehicleOrder();
                                  },
                                  child:
                                      ChooseVehicleOrDriver(name: 'Машина', chooseData: choosenVehicle));
                            })
                        : currentToggle == 1
                            ? StreamedStateBuilderNS(
                                streamedStateNS: wm.choosenVehicleWaybill,
                                builder: (context, choosenVehicle) {
                                  return GestureDetector(
                                      onTap: () {
                                        wm.onChooseVehicleWaybill();
                                      },
                                      child: ChooseVehicleOrDriver(
                                          name: 'Машина', chooseData: choosenVehicle));
                                })
                            : StreamedStateBuilderNS(
                                streamedStateNS: wm.choosenDriverTask,
                                builder: (context, choosenVehicle) {
                                  return GestureDetector(
                                      onTap: () {
                                        wm.onChooseDriverTask();
                                      },
                                      child: ChooseVehicleOrDriver(
                                          name: 'Водитель', chooseData: choosenVehicle));
                                }),
                    ChoosePeriodDate(
                        dateBeginState: wm.dateBeginState,
                        dateEndState: wm.dateEndState,
                        onDateBegin: wm.onDateBegin,
                        onDateEnd: wm.onDateEnd),
                    StreamedStateBuilderNS(streamedStateNS: wm.recentlyChoosenVehicle, builder: (context, recentlyListVehicle){
                      return recentlyListVehicle.isNotEmpty && (currentToggle == 0 || currentToggle == 1) ? Column(children: [
                        const SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          color: Colors.black,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                            child: Text('Недавно использованные:', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.amberAccent),),
                          ),
                        ),
                        for(String vehicle in recentlyListVehicle)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                            child: GestureDetector(
                              onTap: (){
                                wm.onChooseRecently.accept(vehicle);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(vehicle, textAlign: TextAlign.center,),
                              ),),
                            ),
                          ),
                        const SizedBox(height: 60,)
                      ],) : const SizedBox();
                    }),
                    StreamedStateBuilderNS(streamedStateNS: wm.recentlyChoosenDriver, builder: (context, recentlyListDriver){
                      return recentlyListDriver.isNotEmpty && currentToggle == 2  ? Column(children: [
                        const SizedBox(height: 20,),
                        Container(
                          width: double.infinity,
                          color: Colors.black,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                            child: Text('Недавно использованные:', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w600, color: Colors.amberAccent),),
                          ),
                        ),
                        for(String driver in recentlyListDriver)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
                            child: GestureDetector(
                              onTap: (){
                                wm.onChooseRecently.accept(driver);
                              },
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(border: Border.all(), borderRadius: const BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(driver, textAlign: TextAlign.center,),
                                ),),
                            ),
                          ),
                        const SizedBox(height: 60,)
                      ],) : const SizedBox();
                    })
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                    child: GestureDetector(
                      onTap: (){
                        wm.onGetData();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        height: 50,
                        width: double.infinity, child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(child: Text('Запросить данные',style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w600), textAlign: TextAlign.center,)),
                        ),),
                    ),
                  )),
              StreamedStateBuilderNS(streamedStateNS: wm.loadingState, builder: (context, loading){
                return loading ? CircullarProgressBar() : SizedBox();
              })
            ],
          );
        });
  }
}
