import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';

class FullTableFuelConsumptionScreenWM extends WidgetModelStandard {

  final gsmManager = getIt<GSMManager>();
}
