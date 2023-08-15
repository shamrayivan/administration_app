import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class EfficiencyTransportScreenWM extends WidgetModelStandard {

  final efficiencyTransportState = getIt<TransportManager>().efficiencyTransportState;

  final _appRouter = getIt<AppRouter>();

  final onFullEfficiencyTransport = Action<EfficiencyTransport>();

  @override
  void onBind() {
    subscribe(onFullEfficiencyTransport.stream, (efficiencyTransport) {
      _appRouter.push(FullEfficiencyTransportRoute(fullEfficiencyTransport: efficiencyTransport));
    });
  }

}