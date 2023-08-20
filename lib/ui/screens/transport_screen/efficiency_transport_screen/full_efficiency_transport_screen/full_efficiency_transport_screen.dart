import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/transport_screen/efficiency_transport_screen/full_efficiency_transport_screen/full_efficiency_transport_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';

@RoutePage()
class FullEfficiencyTransportScreen extends CoreMwwmWidget {
  FullEfficiencyTransportScreen({
    @PathParam('efficiencyTransport') required dynamic fullEfficiencyTransport,
  }) : super(
          widgetModelBuilder: (_) =>
              FullEfficiencyTransportScreenWM(fullEfficiencyTransport: fullEfficiencyTransport),
        );

  @override
  State<StatefulWidget> createState() => _FullEfficiencyTransportScreenState();
}

class _FullEfficiencyTransportScreenState extends WidgetState<FullEfficiencyTransportScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MediaQuery.of(context).orientation == Orientation.portrait ? AppBar(
        title: GestureDetector(
          onTap: () {
            wm.onBack();
          },
          child: Text(
            wm.fullEfficiencyTransport.vehicleName.isNotEmpty
                ? wm.fullEfficiencyTransport.vehicleName
                : 'Всего',
            style: const TextStyle(color: mainColor),
          ),
        ),
        leadingWidth: 20,
        centerTitle: wm.fullEfficiencyTransport.vehicleName.isNotEmpty ? false : true,
        backgroundColor: blackColor,
      ) : null,
      body: SafeArea(
        child: MediaQuery.of(context).orientation == Orientation.portrait ? SingleChildScrollView(
          child: Column(
            children: [
              wm.fullEfficiencyTransport.vehicleName.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: blackColor)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    wm.fullEfficiencyTransport.vehicleName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: blackColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'Итого: ${wm.fullEfficiencyTransport.balance} руб',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                            )
                          ]),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Итого: ${wm.fullEfficiencyTransport.balance}',
                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ),
              for (int index = 0; index < wm.listEfficiencyTransport.length; index++)
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Text(
                                wm.listEfficiencyTransport[index].customer,
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: null,
                                    foreground: Paint()
                                      ..style = PaintingStyle.stroke
                                      ..color = Colors.black
                                      ..strokeWidth = 1),
                              ),
                              Text(
                                wm.listEfficiencyTransport[index].customer,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700, color: mainColor),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Часы день')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].hoursDay}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Часы ночь')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].hoursNight}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Тоннаж')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].tonnaj}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Объём')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].capacity}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('КМ')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].km}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('ТНКМ')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].tnkm}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Зарплата')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].salary} руб',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Заправка')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].refueling}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Сумма топлива с НДС')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].sumOilWithNDS}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Сумма топлива без НДС')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].sumOilWithoutNDS}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Стоимость запчастей')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].costSparePart}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Сумма без НДС')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].sumWithoutNDS}',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 6,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Стоимость ремонта')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].costRepair} руб',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Divider(
                            height: 5,
                            color: blackColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              const Expanded(child: Text('Остаток')),
                              Expanded(
                                child: Text(
                                  '${wm.listEfficiencyTransport[index].balance} руб',
                                  style: const TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        )
                      ],
                    ),
                  ),
                )
            ],
          ),
        ) : _TableFullEfficiencyTransport(listEfficiencyTransport: wm.listEfficiencyTransport, fullEfficiencyTransport: wm.fullEfficiencyTransport,),
      ),
    );
  }
}

class _TableFullEfficiencyTransport extends StatelessWidget {
  const _TableFullEfficiencyTransport({Key? key, required this.fullEfficiencyTransport, required this.listEfficiencyTransport}) : super(key: key);

  final EfficiencyTransport fullEfficiencyTransport;
  final List<EfficiencyTransport> listEfficiencyTransport;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios_rounded)),
            Container(
              padding: const EdgeInsets.all(10),
              //margin: EdgeInsets.only(right: 70, left: 70),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black)),
              child: Text(
                fullEfficiencyTransport.vehicleName,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Итого: ${fullEfficiencyTransport.balance} руб',
              style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        Stack(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ScrollPhysics(),
            child: Row(children: [
              Container(
                width:
                MediaQuery.of(context).copyWith().size.width /
                    5,
                color: Colors.grey[50],
                //constraints: BoxConstraints(
                //   minWidth: 20, maxWidth: 250),
                child: DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            '',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      listEfficiencyTransport.length,
                          (index) => const DataRow(
                        cells: <DataCell>[
                          DataCell(Text('')),
                        ],
                      ),
                    )),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                    columns: <DataColumn>[
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Часы день',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Часы ночь',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Тоннаж',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Объём',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'КМ',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'ТНКМ',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Зарплата',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Заправка',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Сумма топлива с НДС',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Сумма топлива без НДС',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Стоимость запчастей',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Сумма без НДС',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const DataColumn(
                        label: Expanded(
                          child: Text(
                            'Стоимость ремонта',
                            style: TextStyle(
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              'Остаток',
                              style: TextStyle(
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                        ),
                      ),
                    ],
                    rows: List<DataRow>.generate(
                      listEfficiencyTransport.length,
                          (index) => DataRow(
                        cells: <DataCell>[
                          DataCell(
                            Container(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '${listEfficiencyTransport[index].hoursDay}',
                                  textAlign: TextAlign.right,
                                )),
                          ),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].hoursNight}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].tonnaj}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].capacity}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].km}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].tnkm}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].salary}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].refueling}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].sumOilWithNDS}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].sumOilWithoutNDS}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].costSparePart}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].sumWithoutNDS}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].costRepair}',
                                textAlign: TextAlign.right,
                              ))),
                          DataCell(Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '${listEfficiencyTransport[index].balance}',
                                textAlign: TextAlign.right,
                              ))),
                        ],
                      ),
                    )),
              ),
            ]),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[50],
                border: const Border(
                    right: BorderSide(width: 0.5))),
            width: MediaQuery.of(context).copyWith().size.width / 5,
            //color: Colors.grey[50],
            //constraints: BoxConstraints(
            //   minWidth: 20, maxWidth: 250),
            child: DataTable(
                columns: [
                  DataColumn(
                    label: Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          'Контрагент',
                          style: TextStyle(
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ),
                ],
                rows: List<DataRow>.generate(
                  listEfficiencyTransport.length,
                      (index) => DataRow(
                    cells: <DataCell>[
                      DataCell(Container(
                          alignment: Alignment.centerRight,
                          child: Text(
                              listEfficiencyTransport[index].customer))),
                    ],
                  ),
                )),
          ),
        ]),
      ],
    );
  }
}

