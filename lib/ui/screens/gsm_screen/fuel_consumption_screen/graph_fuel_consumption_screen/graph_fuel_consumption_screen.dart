import 'package:administration_app/model/gsm/gsm_graph_consumption.dart';
import 'package:administration_app/ui/common/widgets/chart/gsm_chart.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/gsm_screen/fuel_consumption_screen/graph_fuel_consumption_screen/graph_fuel_consumption_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class GraphFuelConsumptionScreen extends CoreMwwmWidget {
  GraphFuelConsumptionScreen({
    @PathParam('mode') required int mode,
    @PathParam('data') required String data,
  }) : super(
          widgetModelBuilder: (_) => GraphFuelConsumptionScreenWM(mode: mode, data: data),
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
        title: Text(wm.mode == 1 ? 'По заказам' : wm.mode==2 ? 'По путевым листам' : 'По заданиям', style: const TextStyle(color: mainColor),
        ),
        actions: [GestureDetector(
          onTap: (){
            wm.onGoToFilter();
          },
          child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Icon(Icons.filter_list_alt),
        ),)],
      ) : null,
        body: SafeArea(
          child: EntityStateBuilder(
            streamedState: wm.fuelGraphState,
            builder: (context, fuelGraphState) {
              return GSMChart(
                  text: wm.mode == 1 || wm.mode == 0 ? 'Водители' : 'Машины',
                  dataSource: fuelGraphState?.table.where((element) => element.norm !=0 && element.show).toList() ?? [],
                  xValueMapper: (GSMGraphConsumption graph, _) => graph.date.toString(),
                  yValueMapper: (GSMGraphConsumption graph, _) => graph.norm.toDouble(), gsmFuelGraph: fuelGraphState);
            }
          ),
        ));
  }
}
