import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/efficiency_transport_screen/efficiency_transport_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class EfficiencyTransportScreen extends CoreMwwmWidget {
  EfficiencyTransportScreen() : super(
    widgetModelBuilder: (_) => EfficiencyTransportScreenWM(),
  );

  @override
  State<StatefulWidget> createState() => _EfficiencyTransportScreenState();
}

class _EfficiencyTransportScreenState extends WidgetState<EfficiencyTransportScreenWM> {
  @override
  Widget build(BuildContext context) {
    return AnalyseLogisticsShimmer();
  }
}
