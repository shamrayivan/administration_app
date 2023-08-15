import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class FullEfficiencyTransportScreenWM extends WidgetModelStandard {
  final EfficiencyTransport fullEfficiencyTransport;
  final listEfficiencyTransport = <EfficiencyTransport>[];

  final _appRouter = getIt<AppRouter>();

  final efficiencyTransportState = getIt<TransportManager>().efficiencyTransportState;

  final onBack = Action<void>();

  FullEfficiencyTransportScreenWM({required this.fullEfficiencyTransport});

  @override
  void onInit() {
    efficiencyTransportState.data?.forEach((element) {
      if (element.vehicleName == fullEfficiencyTransport.vehicleName &&
          element.customer != 'Итого' && element.customer!= 'Всего') {
        listEfficiencyTransport.add(element);
      }
    });
    listEfficiencyTransport.add(fullEfficiencyTransport);
  }

  @override
  void onBind() {
    subscribe(onBack.stream, (value) {
      _appRouter.pop();
    });
  }
}
