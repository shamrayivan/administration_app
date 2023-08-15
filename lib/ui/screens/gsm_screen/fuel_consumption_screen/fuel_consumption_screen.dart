import 'package:administration_app/ui/common/widgets/adaptive_scroll_view.dart';
import 'package:administration_app/ui/common/widgets/chart/chart.dart';
import 'package:administration_app/ui/common/widgets/choose_period_date.dart';
import 'package:administration_app/ui/common/widgets/choose_vehicle_or_driver.dart';
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
        return Column(children: [
          ToggleButton(selectedToggle: wm.selectedToggle, toggleWidgets: wm.toggleWidgets, onChangeToggle: wm.onChangeToggle),
          currentToggle == 0 ? StreamedStateBuilder(
            streamedState: wm.choosenVehicle,
            builder: (context, choosenVehicle) {
              return GestureDetector(
                onTap: (){
                  wm.onChooseVehicle();
                },
                  child: ChooseVehicleOrDriver(name: 'Машина', chooseData: choosenVehicle ?? 'Выберите ТС'));
            }
          ) : currentToggle == 1 ? StreamedStateBuilder(
              streamedState: wm.choosenVehicle,
              builder: (context, choosenVehicle) {
                return GestureDetector(
                    onTap: (){
                      wm.onChooseVehicle();
                    },
                    child: ChooseVehicleOrDriver(name: 'Машина', chooseData: choosenVehicle ?? 'Выберите ТС'));
              }
          ) : StreamedStateBuilder(
              streamedState: wm.choosenVehicle,
              builder: (context, choosenVehicle) {
                return GestureDetector(
                    onTap: (){
                      wm.onChooseVehicle();
                    },
                    child: ChooseVehicleOrDriver(name: 'Водитель', chooseData: choosenVehicle ?? 'Выберите Водителя'));
              }
          ),
          ChoosePeriodDate(dateBeginState: wm.dateBeginState, dateEndState: wm.dateEndState, onDateBegin: wm.onDateBegin, onDateEnd: wm.onDateEnd)
        ],);
      }
    );
  }
}

