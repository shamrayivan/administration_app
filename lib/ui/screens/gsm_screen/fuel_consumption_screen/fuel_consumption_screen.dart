import 'package:administration_app/ui/common/widgets/adaptive_scroll_view.dart';
import 'package:administration_app/ui/common/widgets/chart/chart.dart';
import 'package:administration_app/ui/screens/gsm_screen/fuel_consumption_screen/fuel_consumption_screen_wm.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/analyse_logistics_screen/analyse_logistics_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class FuelConsumptionScreen extends CoreMwwmWidget {
  FuelConsumptionScreen()
      : super(
    widgetModelBuilder: (_) => FuelConsumptionScreenWM(),
  );

  @override
  State<StatefulWidget> createState() => _FuelConsumptionScreenState();
}

class _FuelConsumptionScreenState extends WidgetState<FuelConsumptionScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class _ToggleButton extends StatelessWidget {
  const _ToggleButton(
      {Key? key,
        required this.selectedToggle,
        required this.toggleWidgets,
        required this.onChangeToggle})
      : super(key: key);

  final StreamedStateNS<List<bool>> selectedToggle;
  final List<Widget> toggleWidgets;
  final Action<int> onChangeToggle;

  @override
  Widget build(BuildContext context) {
    return StreamedStateBuilderNS(
        streamedStateNS: selectedToggle,
        builder: (context, selectedToggle) {
          return ToggleButtons(
              onPressed: (index) {
                onChangeToggle.accept(index);
              },
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              selectedBorderColor: Colors.black,
              selectedColor: Colors.amberAccent,
              fillColor: Colors.black,
              color: Colors.black,
              constraints: const BoxConstraints(
                minHeight: 30.0,
                minWidth: 80.0,
              ),
              isSelected: selectedToggle,
              children: toggleWidgets);
        });
  }
}
