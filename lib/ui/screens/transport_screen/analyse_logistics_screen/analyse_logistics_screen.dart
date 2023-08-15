import 'package:administration_app/ui/common/widgets/adaptive_scroll_view.dart';
import 'package:administration_app/ui/common/widgets/chart/chart.dart';
import 'package:administration_app/ui/common/widgets/toggle_button.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class AnalyseLogisticsScreen extends CoreMwwmWidget {
  AnalyseLogisticsScreen()
      : super(
          widgetModelBuilder: (_) => AnalyseLogisticsScreenWM(),
        );

  @override
  State<StatefulWidget> createState() => _AnalyseLogisticsScreenState();
}

class _AnalyseLogisticsScreenState extends WidgetState<AnalyseLogisticsScreenWM> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveScrollView(
      child: StreamedStateBuilderNS(
        streamedStateNS: wm.currentToggle,
        builder: (context, currentToggle) {
          return EntityStateBuilder(
              streamedState: currentToggle == 0 ? wm.analysisLogisticManager.orderAnalisysLogistic : currentToggle == 1 ? wm.analysisLogisticManager.waybillAnalisysLogistic : wm.analysisLogisticManager.taskAnalisysLogistic,
              loadingChild: AnalyseLogisticsShimmer(),
              builder: (context, analisysLogistic) {
                return Container(
                  height: MediaQuery.of(context).size.height / 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      MediaQuery.of(context).orientation == Orientation.portrait ? ToggleButton(
                        selectedToggle: wm.selectedToggle,
                        toggleWidgets: wm.toggleWidgets,
                        onChangeToggle: wm.onChangeToggle,
                      ) : SizedBox(),
                      Expanded(
                        child: SizedBox(
                          child: Chart(
                            title: currentToggle == 0 ? 'По заказам' : currentToggle == 1 ? 'По путевым листам' : 'По заданиям',
                            datasource: analisysLogistic ?? [],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              });
        }
      ),
    );
  }
}

