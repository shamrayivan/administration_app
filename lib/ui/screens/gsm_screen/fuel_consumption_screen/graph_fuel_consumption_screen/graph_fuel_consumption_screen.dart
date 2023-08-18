import 'package:administration_app/model/gsm/gsm_graph_consumption.dart';
import 'package:administration_app/ui/common/widgets/adaptive_scroll_view.dart';
import 'package:administration_app/ui/common/widgets/chart/chart.dart';
import 'package:administration_app/ui/common/widgets/chart/gsm_chart.dart';
import 'package:administration_app/ui/common/widgets/choose_period_date.dart';
import 'package:administration_app/ui/common/widgets/choose_vehicle_or_driver.dart';
import 'package:administration_app/ui/common/widgets/circular_progress_bar.dart';
import 'package:administration_app/ui/common/widgets/toggle_button.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/gsm_screen/fuel_consumption_screen/fuel_consumption_screen_wm.dart';
import 'package:administration_app/ui/screens/gsm_screen/fuel_consumption_screen/graph_fuel_consumption_screen/graph_fuel_consumption_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:intl/intl.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class GraphFuelConsumptionScreen extends CoreMwwmWidget {
  GraphFuelConsumptionScreen({
    @PathParam('vehicle') required bool vehicle,
  }) : super(
          widgetModelBuilder: (_) => GraphFuelConsumptionScreenWM(vehicle: vehicle),
        );

  @override
  State<StatefulWidget> createState() => _GraphFuelConsumptionScreenState();
}

class _GraphFuelConsumptionScreenState extends WidgetState<GraphFuelConsumptionScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait ? AppBar(
        backgroundColor: blackColor,
        title: Text('График расхода топлива', style: TextStyle(color: mainColor),
        ),
        actions: [GestureDetector(child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.filter_list_alt),
        ),)],
      ) : null,
        body: GSMChart(
            text: wm.vehicle ? 'Водители' : 'Машины',
            dataSource: wm.fuelGraphState.data?.table.where((element) => element.norm !=0 && element.show).toList() ?? [],
            xValueMapper: (GSMGraphConsumption graph, _) => graph.date.toString(),
            yValueMapper: (GSMGraphConsumption graph, _) => graph.norm.toDouble(), gsmFuelGraph: wm.fuelGraphState.data,));
  }
}
