import 'package:administration_app/model/gsm/gsm_fuel_graph.dart';
import 'package:administration_app/model/gsm/gsm_graph_consumption.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GSMChart extends StatelessWidget {
  const GSMChart({Key? key, required this.text, required this.dataSource, required this.xValueMapper, required this.yValueMapper, required this.gsmFuelGraph}) : super(key: key);

  final String text;
  final List<GSMGraphConsumption> dataSource;
  final String? Function(GSMGraphConsumption, int) xValueMapper;
  final double? Function(GSMGraphConsumption, int) yValueMapper;
  final GSMFuelGraph? gsmFuelGraph;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Column(
        children: [
          if(gsmFuelGraph!=null) gsmFuelGraph?.sostoyanie == '' ? SizedBox() :Text('${gsmFuelGraph?.sostoyanie}'),
          Expanded(
            child: SfCartesianChart(
                title: ChartTitle(
                    text: text,
                    textStyle: TextStyle(fontSize: 10, color: blackColor)),
                primaryXAxis: CategoryAxis(
                    interval: MediaQuery.of(context).orientation == Orientation.portrait
                        ? null
                        : dataSource.length > 6
                        ? 2
                        : 1,
                    labelIntersectAction: AxisLabelIntersectAction.trim,
                    maximumLabels: 5,
                    // tickPosition: TickPosition.inside,
                    labelPlacement:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? LabelPlacement.betweenTicks
                        : dataSource.length > 5
                        ? LabelPlacement.onTicks
                        : LabelPlacement.betweenTicks,
                    // Axis labels will be rotated to 90 degree
                    labelRotation:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 90
                        : 0),
                onDataLabelTapped: (DataLabelTapDetails args) {
                  print(args.pointIndex);
                },
                zoomPanBehavior: ZoomPanBehavior(
                    enableSelectionZooming: true,
                    selectionRectBorderColor: Colors.red,
                    selectionRectBorderWidth: 1,
                    selectionRectColor: Colors.grey,
                    enablePinching: true),
                tooltipBehavior: TooltipBehavior(
                    tooltipPosition: TooltipPosition.pointer,
                    opacity: 0.8,
                    duration: 10000,
                    color: Colors.white,
                    enable: true,
                    builder: (data, dynamic point, dynamic series,
                        int pointIndex, int seriesIndex) {
                      return data is GSMGraphConsumption ? Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: blackColor)),
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                            '${data.date}\n\nНорма: ${num.parse(data.norm.toStringAsFixed(2))}\n\n${data.drivers}\n\n${data.vehicles}\n\n${data.waybills} \n\n'),
                      ) : SizedBox();
                    }),
                series: <ChartSeries>[
                  LineSeries<GSMGraphConsumption, dynamic>(
                    selectionBehavior: SelectionBehavior(
                      // Enables the selection
                        enable: true),
                    // trendlines: <Trendline>[
                    // Trendline(type: TrendlineType.exponential,
                    // enableTooltip: false,
                    // color: Colors.black,

                    // )
                    // ],
                    // widget.trendlines,
                    // // zoomOrNot
                    // //     ? []
                    // //     :
                    // [
                    //         Trendline(
                    //             type: TrendlineType.exponential, color: Colors.black),
                    //       ],
                    // trendlines: widget.trendlines,
                    animationDuration: 30,
                    color: blackColor,
                    dataSource: dataSource,
                    markerSettings: const MarkerSettings(isVisible: true),
                    xValueMapper: xValueMapper,
                    yValueMapper: yValueMapper,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
