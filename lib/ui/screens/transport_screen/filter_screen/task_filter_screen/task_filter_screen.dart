import 'package:administration_app/ui/screens/transport_screen/filter_screen/order_filter_screen/order_filter_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/filter_screen/task_filter_screen/task_filter_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class TaskFilterScreen extends CoreMwwmWidget {
  TaskFilterScreen() : super(
    widgetModelBuilder: (_) => TaskFilterScreenWM(),
  );

  @override
  State<StatefulWidget> createState() => _TaskFilterScreenState();
}

class _TaskFilterScreenState extends WidgetState<TaskFilterScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('По заданиям'),);
  }
}
