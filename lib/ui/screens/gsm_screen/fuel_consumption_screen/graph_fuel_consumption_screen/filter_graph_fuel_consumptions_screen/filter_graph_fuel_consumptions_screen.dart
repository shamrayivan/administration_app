import 'package:administration_app/ui/common/widgets/circular_progress_bar.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/gsm_screen/fuel_consumption_screen/graph_fuel_consumption_screen/filter_graph_fuel_consumptions_screen/filter_graph_fuel_consumptions_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class FilterGraphFuelConsumptionScreen extends CoreMwwmWidget {
  FilterGraphFuelConsumptionScreen({super.key,
    @PathParam('mode') required int mode,
    @PathParam('data') required String data,
  }) : super(
          widgetModelBuilder: (_) => FilterGraphFuelConsumptionScreenWM(mode: mode, data: data),
        );

  @override
  State<StatefulWidget> createState() => _FilterGraphFuelConsumptionScreenState();
}

class _FilterGraphFuelConsumptionScreenState
    extends WidgetState<FilterGraphFuelConsumptionScreenWM> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(floatingActionButton: FloatingActionButton.extended(
            foregroundColor: mainColor,
            backgroundColor: blackColor,
            onPressed: (){
              wm.onUpdateDate();
            }, label: const Text('Отфильтровать')),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
            appBar: AppBar(
              backgroundColor: blackColor,
              title: const Text(
                "Фильтр",
                style: TextStyle(color: mainColor),
              ),
              // automaticallyImplyLeading: false
            ),
            body: SafeArea(
                child: StreamedStateBuilderNS(
                  streamedStateNS: wm.listChoosenData,
                  builder: (context, listData) {
                    return ListView.builder(
                        itemCount: wm.listChoosenData.value.length,
                        itemBuilder: (context, index) {
                          return wm.mode== 1 || wm.mode ==2 ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(child: Text('${listData[index].fioDriver}')),
                                CupertinoSwitch(
                                    trackColor: blackColor,
                                    activeColor: mainColor,
                                    value: listData[index].selected,
                                    onChanged: (value){
                                      listData[index].selected = value;
                                      wm.listChoosenData.accept(listData);
                                    }),
                              ],
                            ),
                          ) : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(child: Text('${listData[index].nameVehicle}')),
                                CupertinoSwitch(
                                  trackColor: blackColor,
                                    activeColor: mainColor,
                                    value: listData[index].selected,
                                    onChanged:(value){
                                      listData[index].selected = value;
                                      wm.listChoosenData.accept(listData);
                                    }),
                              ],
                            ),
                          );
                        });
                  }
                ))),
        StreamedStateBuilderNS(streamedStateNS: wm.loadingState, builder: (context, loading){
          return loading ? const CircullarProgressBar() : const SizedBox();
        })
      ],
    );
  }
}
