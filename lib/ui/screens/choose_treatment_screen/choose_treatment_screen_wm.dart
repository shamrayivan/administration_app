import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class ChooseTreatmentScreenWm extends WidgetModelStandard {

  final onTransport = Action<void>();
  final onGSM = Action<void>();
  final onGoToSettings = Action<void>();
  final _appRouter = getIt<AppRouter>();


  @override
  void onBind() {
    subscribe(onGoToSettings.stream, (value) {
      _appRouter.pushNamed(RouteScreen.settings);
    });
    subscribe(onTransport.stream, (value) {
      _appRouter.pushNamed(RouteScreen.transport);
    });
    subscribe(onGSM.stream, (value) {
      _appRouter.pushNamed(RouteScreen.gsm);
    });
  }
}