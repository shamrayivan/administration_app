import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/gsm_screen/table_fuel_consumption_screen/full_table_fuel_consumption_screen/full_table_fuel_consumption_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class FullTableFuelConsumptionScreen extends CoreMwwmWidget {
  FullTableFuelConsumptionScreen()
      : super(
          widgetModelBuilder: (_) => FullTableFuelConsumptionScreenWM(),
        );

  @override
  State<StatefulWidget> createState() => _FullTableFuelConsumptionScreenState();
}

class _FullTableFuelConsumptionScreenState extends WidgetState<FullTableFuelConsumptionScreenWM> {
  @override
  Widget build(BuildContext context) {
    return EntityStateBuilder(
        streamedState: wm.gsmManager.fuelTableState,
        builder: (context, tableData) {
          final mediaQuerry = MediaQuery.of(context);
          return Scaffold(
            appBar: mediaQuerry.orientation == Orientation.portrait
                ? AppBar(
              backgroundColor: blackColor,
                    title: const Text('ГСМ ТАБЛИЦА', style: TextStyle(color: mainColor),),
                  )
                : null,
            body: SafeArea(
              child: DataTable2(
                columnSpacing: 12,
                minWidth: tableData!.first.keys.length * 130,
                  border: TableBorder.all(),
                  columns: [
                    for(int i =0; i< tableData.first.keys.length; i++)
                      DataColumn(label: Center(child: Text(tableData.first.keys.toList()[i].toString(), textAlign: TextAlign.center,)))
                  ], rows: [
                    // DataRow(cells: [DataCell(Text(tableData[0].values.toList()[0]))])
                    // for(int i = 0 ; i< tableData.first.keys.length; i++)
                    //   DataRow(cells: [
                    // //     for(int j = 0; j<tableData.first.keys.length; i++)
                    // //       DataCell(Text(tableData[0].values.toList()[0]))
                    //   ]),
                  for(int i = 0 ; i< tableData.length; i++)
                  DataRow(cells: [
                    for(int j = 0; j<tableData.first.keys.length; j++)
                    DataCell(Center(child: Text(tableData[i].values.toList()[j].toString(), textAlign: TextAlign.center,))),
                  ]),
                ],
                ),
            ),
          );
        });
  }
}
