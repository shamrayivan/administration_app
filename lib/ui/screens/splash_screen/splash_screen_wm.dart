import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';

class SplashScreenWm extends WidgetModelStandard {

  final _appRouter = getIt<AppRouter>();

  @override
  void onInit()async{
    await Future<dynamic>.delayed(Duration(seconds: 2));
    _appRouter.replaceNamed(RouteScreen.auth);
  }
}