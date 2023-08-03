import 'package:administration_app/di/di.dart';
import 'package:mwwm/mwwm.dart';

class WidgetModelStandard extends WidgetModel {
  WidgetModelStandard() : super(
      getIt<WidgetModelDependencies>());
}
