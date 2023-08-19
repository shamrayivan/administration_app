import 'package:administration_app/ui/common/widgets/circular_progress_bar.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/transport_screen/filter_screen/order_filter_screen/order_filter_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class OrderFilterScreen extends CoreMwwmWidget {
  OrderFilterScreen()
      : super(
          widgetModelBuilder: (_) => OrderFilterScreenWM(),
        );

  @override
  State<StatefulWidget> createState() => _OrderFilterScreenState();
}

class _OrderFilterScreenState extends WidgetState<OrderFilterScreenWM> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await true,
      child: StreamedStateBuilderNS(
        streamedStateNS: wm.loadingState,
        builder: (context, loading) {
          return Stack(
            children: [
              SafeArea(
                child: Scaffold(
                  floatingActionButton: Container(
                    color: Colors.black,
                    height: 40,
                    width: MediaQuery.of(context).copyWith().size.width,
                    child: FloatingActionButton.extended(
                      icon: const Icon(
                        Icons.event_available,
                        color: Colors.amberAccent,
                      ),
                      label: const Text(
                        " Сохранить",
                        style: TextStyle(color: Colors.amberAccent, fontSize: 15),
                      ),
                      onPressed: () {
                        wm.onSave();
                      },
                      backgroundColor: Colors.black,
                    ),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                  appBar: AppBar(
                    leading: GestureDetector(
                      onTap: (){
                        wm.onBack();
                      },
                        child: Icon(Icons.arrow_back_ios)),
                    centerTitle: false,
                    actions: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              wm.onEnableAll();
                            },
                            child: const Icon(
                              Icons.check_box_rounded,
                              color: Colors.amberAccent,
                              size: 30.0,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Text(
                            '|',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () {
                              wm.onDisableAll();
                            },
                            child: const Icon(
                              Icons.check_box_outline_blank_sharp,
                              color: Colors.amberAccent,
                              size: 30.0,
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                        ],
                      )
                    ],
                    backgroundColor: blackColor,
                    title: const Text(
                      'Фильтр по заказам',
                      style: TextStyle(color: mainColor),
                    ),
                  ),
                  body: StreamedStateBuilder(
                      streamedState: wm.typesOfVehicleStreamedState,
                      builder: (context, typesOfVehicle) {
                        return ListView.builder(
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  !typesOfVehicle![index].itsGroup && typesOfVehicle[index].parentType.isEmpty
                                      ? GestureDetector(
                                    onTap: (){
                                      wm.onChangeSelected(typesOfVehicle[index]);
                                    },
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: typesOfVehicle[index].selected
                                                      ? const Icon(
                                                          Icons.check_box_rounded,
                                                          color: Colors.amberAccent,
                                                          size: 26.0,
                                                        )
                                                      : const Icon(
                                                          Icons.check_box_outline_blank_sharp,
                                                          color: Colors.amberAccent,
                                                          size: 26.0,
                                                        ),
                                                ),
                                                Expanded(child: Text(typesOfVehicle[index].type))
                                              ],
                                            ),
                                          ),
                                      )
                                      : typesOfVehicle[index].parentType.isEmpty ?  ExpansionTile(
                                        iconColor: greyColor,
                                        maintainState: true,
                                        trailing: const Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Icon(Icons.arrow_drop_down_sharp),
                                        ),
                                        title: Row(
                                          children: [
                                            GestureDetector(
                                              onTap: (){
                                                wm.onChangeSelectedGroup(typesOfVehicle[index]);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: typesOfVehicle[index].selected
                                                    ? const Icon(
                                                  Icons.check_box_rounded,
                                                  color: Colors.amberAccent,
                                                  size: 26.0,
                                                )
                                                    : const Icon(
                                                  Icons.check_box_outline_blank_sharp,
                                                  color: Colors.amberAccent,
                                                  size: 26.0,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              typesOfVehicle[index].type,
                                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                                            ),
                                          ],
                                        ),
                                        tilePadding: const EdgeInsets.all(0),
                                        textColor: greyColor,
                                        children: [
                                          for (int i = 0; i < typesOfVehicle.length; i++)
                                            typesOfVehicle[index].type == typesOfVehicle[i].parentType ?
                                            GestureDetector(
                                              onTap: (){
                                                wm.onChangeSelected(typesOfVehicle[i]);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: typesOfVehicle[i].selected
                                                          ? const Icon(
                                                        Icons.check_box_rounded,
                                                        color: Colors.amberAccent,
                                                        size: 26.0,
                                                      )
                                                          : const Icon(
                                                        Icons.check_box_outline_blank_sharp,
                                                        color: Colors.amberAccent,
                                                        size: 26.0,
                                                      ),
                                                    ),
                                                    Expanded(child: Text(typesOfVehicle[i].type))
                                                  ],
                                                ),
                                              ),
                                            ) : const SizedBox()
                                        ],
                                      ) : const SizedBox(),
                                  if(index + 1 == typesOfVehicle.length) SizedBox(height: 50,)
                                ],
                              );
                            },
                            itemCount: typesOfVehicle?.length ?? 0);
                      }),
                ),
              ),
              loading ? CircullarProgressBar() : SizedBox()
            ],
          );
        }
      ),
    );
  }
}
