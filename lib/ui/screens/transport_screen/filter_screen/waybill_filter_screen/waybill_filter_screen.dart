import 'package:administration_app/ui/screens/transport_screen/filter_screen/order_filter_screen/order_filter_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/filter_screen/waybill_filter_screen/waybill_filter_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class WaybillFilterScreen extends CoreMwwmWidget {
  WaybillFilterScreen() : super(
    widgetModelBuilder: (_) => WaybillFilterScreenWM(),
  );

  @override
  State<StatefulWidget> createState() => _WaybillFilterScreenState();
}

class _WaybillFilterScreenState extends WidgetState<WaybillFilterScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('По путевым листам'),);
  }
}
