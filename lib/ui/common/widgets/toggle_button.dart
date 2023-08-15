import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class ToggleButton extends StatelessWidget {
 const ToggleButton(
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