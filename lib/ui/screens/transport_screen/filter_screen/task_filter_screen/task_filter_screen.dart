import 'package:administration_app/ui/common/widgets/circular_progress_bar.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/transport_screen/filter_screen/task_filter_screen/task_filter_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

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
                            onTap: () {
                              wm.onBack();
                            },
                            child: const Icon(Icons.arrow_back_ios)),
                        centerTitle: false,
                        actions: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  wm.onShowRetired.accept(!wm.showRetiredState.value);
                                },
                                child: Row(
                                  children: [
                                    const Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Показывать",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                        Text(
                                          "выбывшие",
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                    StreamedStateBuilderNS(
                                        streamedStateNS: wm.showRetiredState,
                                        builder: (context, showRetired) {
                                          return Switch(
                                            value: showRetired,
                                            inactiveThumbColor: Colors.white,
                                            inactiveTrackColor: Colors.white,
                                            activeTrackColor: Colors.lightGreenAccent[400],
                                            activeColor: Colors.white,
                                            onChanged: (bool value) {
                                              wm.onShowRetired.accept(value);
                                            },
                                          );
                                        }
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 6,),
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
                      ),
                      body: StreamedStateBuilder(
                        streamedState: wm.vehiclesStreamedState,
                        builder: (context, vehicles) {
                          return StreamedStateBuilderNS(
                              streamedStateNS: wm.showRetiredState,
                              builder: (context, showRetired) {
                                return ListView.builder(
                                  primary: false,
                                  itemCount: vehicles?.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        vehicles?[index].itsGroup ?? false
                                            ? ExpansionTile(
                                          iconColor: greyColor,
                                          maintainState: true,
                                          trailing: const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Icon(Icons.arrow_drop_down_sharp),
                                          ),
                                          title: Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  wm.onChangeTypeOfVehicle(vehicles?[index]);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: vehicles?[index].selected ?? false
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
                                                '${vehicles?[index].vehicleName}',
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w600, fontSize: 16),
                                              ),
                                            ],
                                          ),
                                          tilePadding: const EdgeInsets.all(0),
                                          textColor: greyColor,
                                          children: [
                                            for (int i = 0; i < vehicles!.length; i++)
                                              if (vehicles[index].vehicleName ==
                                                  vehicles[i].parentType)
                                                vehicles[i].dateRetired ==0 || showRetired ? GestureDetector(
                                                  onTap: (){
                                                    wm.onChangeVehicle(vehicles[i]);
                                                  },
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: vehicles[i].selected
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
                                                      Expanded(
                                                          child: Text(
                                                            vehicles[i].vehicleName,
                                                            style: TextStyle(
                                                                color: vehicles[i].dateRetired != 0
                                                                    ? Colors.grey
                                                                    : Colors.black),
                                                          )),
                                                    ],
                                                  ),
                                                ) : SizedBox(),
                                          ],
                                        )
                                            : const SizedBox(),
                                        if (index + 1 == vehicles?.length)
                                          Column(
                                            children: [
                                              for (int i = 0; i < vehicles!.length; i++)
                                                if (vehicles[i].dateRetired !=0 &&
                                                    vehicles[i].parentType.isEmpty && showRetired)
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          wm.onChangeVehicle(vehicles[i]);
                                                        },
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: vehicles[i].selected
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
                                                      Expanded(
                                                          child: Text(
                                                            vehicles[i].vehicleName,
                                                            style: TextStyle(
                                                                color: vehicles[i].dateRetired != 0
                                                                    ? Colors.grey
                                                                    : Colors.black),
                                                          )),
                                                    ],
                                                  ),
                                              const SizedBox(
                                                height: 50,
                                              ),
                                            ],
                                          ),

                                      ],
                                    );
                                  },
                                );
                              }
                          );
                        },
                      )
                  ),
                ),
                loading ? const CircullarProgressBar() : const SizedBox()
              ],
            );
          }),
    );
  }
}
