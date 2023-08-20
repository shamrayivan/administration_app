import 'package:administration_app/model/gsm/gsm_fuel_graph.dart';
import 'package:administration_app/model/gsm/gsm_graph_consumption.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GSMChart extends StatelessWidget {
  const GSMChart(
      {Key? key,
      required this.text,
      required this.dataSource,
      required this.xValueMapper,
      required this.yValueMapper,
      required this.gsmFuelGraph})
      : super(key: key);

  final String text;
  final List<GSMGraphConsumption> dataSource;
  final String? Function(GSMGraphConsumption, int) xValueMapper;
  final double? Function(GSMGraphConsumption, int) yValueMapper;
  final GSMFuelGraph? gsmFuelGraph;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (gsmFuelGraph != null)
          gsmFuelGraph?.sostoyanie == ''
              ? const SizedBox()
              : Text(
                  '${gsmFuelGraph?.sostoyanie}',
                  style: const TextStyle(color: greyColor),
                ),
        Expanded(
          child: SfCartesianChart(
              title: ChartTitle(
                  text: text, textStyle: const TextStyle(fontSize: 10, color: blackColor)),
              primaryXAxis: CategoryAxis(
                  interval: MediaQuery.of(context).orientation == Orientation.portrait
                      ? null
                      : dataSource.length > 6
                          ? 2
                          : 1,
                  labelIntersectAction: AxisLabelIntersectAction.trim,
                  maximumLabels: 5,
                  // tickPosition: TickPosition.inside,
                  labelPlacement: MediaQuery.of(context).orientation == Orientation.portrait
                      ? LabelPlacement.betweenTicks
                      : dataSource.length > 5
                          ? LabelPlacement.onTicks
                          : LabelPlacement.betweenTicks,
                  // Axis labels will be rotated to 90 degree
                  labelRotation:
                      MediaQuery.of(context).orientation == Orientation.portrait ? 90 : 0),
              zoomPanBehavior: ZoomPanBehavior(
                  enableSelectionZooming: true,
                  selectionRectBorderColor: Colors.red,
                  selectionRectBorderWidth: 1,
                  selectionRectColor: Colors.grey,
                  enablePinching: true),
              tooltipBehavior: TooltipBehavior(
                  elevation: 20,
                  enable: true,
                  opacity: 0.9,
                  duration: 10000,
                  textAlignment: ChartAlignment.near,
                  color: Colors.white,
                  canShowMarker: false,
                  textStyle: const TextStyle(color: blackColor)),
              // tooltipBehavior: TooltipBehavior(
              //     tooltipPosition: TooltipPosition.pointer,
              //     opacity: 0.8,
              //     duration: 10000,
              //     color: Colors.white,
              //     enable: true,
              //     builder: (data, dynamic point, dynamic series, int pointIndex, int seriesIndex) {
              //       if(pointIndex ==data.length) return SizedBox();
              //       return data is GSMGraphConsumption
              //           ? Container(
              //               decoration: BoxDecoration(border: Border.all(color: blackColor)),
              //               width: MediaQuery.of(context).size.width / 1.75,
              //               height: MediaQuery.of(context).size.width / 1.75,
              //               child: SingleChildScrollView(
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(2.0),
              //                   child: Text(
              //                       '${data.date}\n\nНорма: ${num.parse(data.norm.toStringAsFixed(2))}\n\n${data.drivers}\n\n${data.vehicles}\n\n${data.waybills} \n\n'),
              //                 ),
              //               ),
              //             )
              //           : const SizedBox();
              //     }),
              onTooltipRender: (TooltipArgs args) {
                  final List<String> listWaybills =
                    dataSource[args.pointIndex!.toInt()].waybills.split(',');
                final List<String> listDrivers =
                    dataSource[args.pointIndex!.toInt()].drivers.split(',');
                final List<String> listVehicles =
                    dataSource[args.pointIndex!.toInt()].vehicles.split(',');
                args.header = dataSource[args.pointIndex!.toInt()].date.toString();
                args.text =
                    'Норма: ${dataSource[args.pointIndex!.toInt()].norm.toStringAsFixed(2)}\n\n${listDrivers.join('\n').trim()}\n\n${listVehicles.join('\n').trim()}\n\n${listWaybills.join('\n').trim()}';
                // if (args.pointIndex == 0) {
                //   //Tooltip without header
                //   args.header = '123';
                // }
                // if (args.pointIndex == 1) {
                //   //Tooltip with customized header
                //   args.header = 'Sold';
                // }
                // if (args.pointIndex == 2) {
                //   //Tooltip with X and Y positions of data points
                //   args.header = 'x : y';
                //   args.text = '${args.locationX!.floor()} : ${args.locationY!.floor()}';
                // }
                // if (args.pointIndex == 3) {
                //   //Tooltip with formatted DateTime values
                //   List<dynamic>? chartdata = args.dataPoints;
                //   // args.header = DateFormat('d MMM yyyy').format(chartdata?[3]!.x);
                //   args.text = '${chartdata?[3].x}';
                // }
              },
              series: <ChartSeries>[
                LineSeries<GSMGraphConsumption, dynamic>(
                  // selectionBehavior: SelectionBehavior(enable: true),
                  trendlines: dataSource.length < 2
                      ? null
                      : <Trendline>[
                          Trendline(
                            width: 1,
                            type: TrendlineType.exponential,
                            color: Colors.black,
                          )
                        ],
                  enableTooltip: true,
                  dataLabelSettings: const DataLabelSettings(isVisible: true, textStyle: TextStyle(fontSize: 11)),
                  animationDuration: 30,
                  color: blackColor,
                  dataSource: dataSource,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    height: 12,
                    width: 12,
                  ),
                  xValueMapper: xValueMapper,
                  yValueMapper: yValueMapper,
                ),
              ]),
        ),
      ],
    );
  }
}
