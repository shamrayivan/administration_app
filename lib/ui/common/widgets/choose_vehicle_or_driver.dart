import 'package:administration_app/ui/res/const_colors.dart';
import 'package:flutter/material.dart';

class ChooseVehicleOrDriver extends StatelessWidget {
  const ChooseVehicleOrDriver({Key? key, required this.name, required this.chooseData})
      : super(key: key);

  final String name;
  final String chooseData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(name),
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            decoration: BoxDecoration(border: Border.all(color: blackColor)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text(chooseData, textAlign: TextAlign.center,)),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
