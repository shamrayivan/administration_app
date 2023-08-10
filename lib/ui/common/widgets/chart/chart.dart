import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key, required this.title, required this.datasource}) : super(key: key);

  final String title;
  final List<AnalysisLogistic> datasource;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      // legend: Legend(isVisible: true, position: LegendPosition.bottom),
      onLegendItemRender: (LegendRenderArgs args) {
        args.legendIconType = LegendIconType.circle;
      },
      title:  MediaQuery.of(context).orientation == Orientation.portrait ?
      ChartTitle(text: title, borderColor: Colors.amberAccent) : null,
      primaryXAxis: CategoryAxis(
        maximumLabelWidth: MediaQuery.of(context).orientation == Orientation.portrait ? MediaQuery.of(context).size.width/9 : MediaQuery.of(context).size.width/20,
        labelIntersectAction: AxisLabelIntersectAction.trim,
      ),
      // primaryYAxis: CategoryAxis(
      // ),
      trackballBehavior: TrackballBehavior(
          enable: true,
          activationMode: ActivationMode.singleTap,
          tooltipDisplayMode: TrackballDisplayMode.groupAllPoints,
          tooltipSettings:
          InteractiveTooltip(enable: true, color: Colors.blueGrey[300])),
      tooltipBehavior: TooltipBehavior(enable: true),
      series: <ChartSeries>[
        BarSeries<AnalysisLogistic, dynamic>(
          //selectionBehavior: _selectionBehavior,
            name: 'Прошлый год',
            color: const Color.fromRGBO(251, 96, 127, 100),
            dataSource: datasource,
            xValueMapper: (AnalysisLogistic ch, _) => ch.lastMonth,
            yValueMapper: (AnalysisLogistic ch, _) => ch.lastYear),
        BarSeries<AnalysisLogistic, dynamic>(
          //selectionBehavior: _selectionBehavior,
            name: 'Текущий год',
            color: Colors.deepPurpleAccent,
            dataSource: datasource,
            xValueMapper: (AnalysisLogistic ch, _) => ch.currentMonth,
            yValueMapper: (AnalysisLogistic ch, _) => ch.currentYear),
      ],
    );
  }
}
