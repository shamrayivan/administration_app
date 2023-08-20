import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class GraphFuelConsumptionScreenWM extends WidgetModelStandard {

  final int mode;
  final String data;
  final _appRouter = getIt<AppRouter>();

  final loadingState = StreamedStateNS<bool>(false);

  final fuelGraphState = getIt<GSMManager>().fuelGraphState;

  final onGoToFilter = Action<void>();

  GraphFuelConsumptionScreenWM({ required this.mode, required this.data});

  @override
  void onBind() {
    subscribe(onGoToFilter.stream, (value) {
      _appRouter.push(FilterGraphFuelConsumptionRoute(mode: mode, data: data));
    });
  }
}
