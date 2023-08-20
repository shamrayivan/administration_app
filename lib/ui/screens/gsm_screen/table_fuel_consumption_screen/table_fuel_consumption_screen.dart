import 'package:administration_app/ui/common/widgets/choose_period_date.dart';
import 'package:administration_app/ui/common/widgets/circular_progress_bar.dart';
import 'package:administration_app/ui/common/widgets/custom_text_input.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/gsm_screen/table_fuel_consumption_screen/table_fuel_consumption_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class TableFuelConsumptionScreen extends CoreMwwmWidget {
  TableFuelConsumptionScreen()
      : super(
          widgetModelBuilder: (_) => TableFuelConsumptionScreenWM(),
        );

  @override
  State<StatefulWidget> createState() => _TableFuelConsumptionScreenState();
}

class _TableFuelConsumptionScreenState extends WidgetState<TableFuelConsumptionScreenWM> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                  child: StreamedStateBuilderNS(
                    streamedStateNS: wm.modeState,
                    builder: (context, mode) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Выбрать период',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mode ? blackColor.withOpacity(0.7) : blackColor,
                                      fontWeight: mode ? null : FontWeight.w600),
                                ),
                              ),
                              CupertinoSwitch(
                                trackColor: blackColor,
                                activeColor: mainColor,
                                value: mode,
                                onChanged: (value) {
                                  wm.modeState.accept(value);
                                },
                              ),
                              Expanded(
                                child: Text(
                                  'Весь год',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: mode ? blackColor : blackColor.withOpacity(0.7),
                                      fontWeight: mode ? FontWeight.w600 : null),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          mode
                              ? Row(
                                  children: [
                                    const Expanded(
                                        child: Text(
                                      'Год',
                                      textAlign: TextAlign.center,
                                    )),
                                    Expanded(
                                        child: Padding(
                                      padding: const EdgeInsets.only(right: 100),
                                      child: SizedBox(
                                          width: 50,
                                          child: CustomTextField(
                                            keyboardType: TextInputType.number,
                                              isDouble: true,
                                              borderColor: blackColor,
                                              controller: wm.yearController,
                                              enabled: true)),
                                    ))
                                  ],
                                )
                              : ChoosePeriodDate(
                                  dateBeginState: wm.dateBeginState,
                                  dateEndState: wm.dateEndState,
                                  onDateBegin: wm.onDateBegin,
                                  onDateEnd: wm.onDateEnd),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Text(
                                'Периодичность',
                                textAlign: TextAlign.center,
                              ),
                              GestureDetector(
                                onTap: () {
                                  wm.onPeriod();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: const BorderRadius.all(Radius.circular(10))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        StreamedStateBuilderNS(
                                            streamedStateNS: wm.periodicState,
                                            builder: (context, period) {
                                              return Text(period);
                                            }),
                                        const Icon(Icons.arrow_drop_down)
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          StreamedStateBuilderNS(
                            streamedStateNS: wm.typeOfVehicleState,
                            builder: (context, typeOfVehicleState) {
                              return Column(children: [
                                for(var type in typeOfVehicleState)
                                Column(
                                  children: [
                                    const Divider(thickness: 1, color: blackColor, height: 8,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      child: Row(children: [
                                        Expanded(child: Text(type.type)),
                                        CupertinoSwitch(
                                          trackColor: blackColor,
                                          activeColor: mainColor,
                                          value: type.selected,
                                          onChanged: (value) {
                                            type.selected = value;
                                            wm.typeOfVehicleState.accept(typeOfVehicleState);
                                          },
                                        ),
                                      ],),
                                    ),
                                  ],
                                ),
                                const Divider(thickness: 1, color: blackColor, height: 8,),
                              ],);
                            }
                          ),
                          const SizedBox(height: 100,)
                        ],
                      );
                    },
                  ),
                ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                    child: GestureDetector(
                      onTap: (){
                        wm.onGetData();
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        height: 50,
                        width: MediaQuery.of(context).size.width/2, child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: Text('Запросить данные',style: TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.w600), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,)),
                      ),),
                    ),
                  )),
              StreamedStateBuilderNS(streamedStateNS: wm.loadingState, builder: (context, loading){
                return loading ? CircullarProgressBar() : SizedBox();
              })
            ],
          ),
        ),
      );
  }
}
