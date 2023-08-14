import 'package:administration_app/ui/common/widgets/adaptive_scroll_view.dart';
import 'package:administration_app/ui/common/widgets/chart/chart.dart';
import 'package:administration_app/ui/screens/gsm_screen/fuel_consumption_screen/fuel_consumption_screen_wm.dart';
import 'package:administration_app/ui/screens/gsm_screen/table_fuel_consumption_screen/table_fuel_consumption_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class TableFuelConsumptionScreen extends CoreMwwmWidget {
  TableFuelConsumptionScreen()
      : super(
    widgetModelBuilder: (_) => TableFuelConsumptionScreenWM(),
  );

  @override
  State<StatefulWidget> createState() => _TableFuelConsumptionScreenState();
}

class _TableFuelConsumptionScreenState extends WidgetState<TableFuelConsumptionScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
