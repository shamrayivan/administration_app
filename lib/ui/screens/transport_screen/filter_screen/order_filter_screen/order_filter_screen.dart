import 'package:administration_app/ui/screens/transport_screen/filter_screen/order_filter_screen/order_filter_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class OrderFilterScreen extends CoreMwwmWidget {
  OrderFilterScreen() : super(
    widgetModelBuilder: (_) => OrderFilterScreenWM(),
  );

  @override
  State<StatefulWidget> createState() => _OrderFilterScreenState();
}

class _OrderFilterScreenState extends WidgetState<OrderFilterScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('По заказам'),);
  }
}
