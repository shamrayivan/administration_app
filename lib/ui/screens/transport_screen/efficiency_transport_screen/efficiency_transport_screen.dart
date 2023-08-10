import 'package:administration_app/ui/common/widgets/adaptive_scroll_view.dart';
import 'package:administration_app/ui/common/widgets/svg_default.dart';
import 'package:administration_app/ui/res/assets.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/gsm_screen/gsm_screen_wm.dart';
import 'package:administration_app/ui/screens/splash_screen/splash_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/efficiency_transport_screen/efficiency_transport_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/transport_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

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
