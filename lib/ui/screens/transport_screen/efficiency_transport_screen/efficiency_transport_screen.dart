import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/screens/transport_screen/efficiency_transport_screen/efficiency_transport_screen_shimmer.dart';
import 'package:administration_app/ui/screens/transport_screen/efficiency_transport_screen/efficiency_transport_screen_wm.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mwwm/mwwm.dart';
import 'package:relation/relation.dart';

@RoutePage()
class EfficiencyTransportScreen extends CoreMwwmWidget {
  EfficiencyTransportScreen()
      : super(
          widgetModelBuilder: (_) => EfficiencyTransportScreenWM(),
        );

  @override
  State<StatefulWidget> createState() => _EfficiencyTransportScreenState();
}

class _EfficiencyTransportScreenState extends WidgetState<EfficiencyTransportScreenWM> {
  @override
  Widget build(BuildContext context) {
    return EntityStateBuilder(
      loadingChild: const EfficiencyTransportShimmer(),
        streamedState: wm.efficiencyTransportState,
        builder: (context, efficiencyTransport) {
        return ListView.builder(
              itemBuilder: (context, index) {
                return efficiencyTransport?[index].customer == 'Итого' || efficiencyTransport![index].vehicleName.isEmpty? Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        wm.onFullEfficiencyTransport.accept(efficiencyTransport[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.emoji_transportation,
                                  color: mainColor,
                                  size: 30,
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      efficiencyTransport![index].vehicleName.isNotEmpty ?  Text('ТС: ${efficiencyTransport[index].vehicleName}', style: const TextStyle(fontSize: 15),) : const Text('Всего', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                                      Text('Остаток: ' + '${efficiencyTransport[index].balance} руб', style: const TextStyle(color: greyColor),)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    if(index + 1 == efficiencyTransport.length) const SizedBox(height: 25,),
                  ],
                ) : const SizedBox();
              },
              itemCount: efficiencyTransport?.length);
        });
  }
}
