import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/analysis_logistic/analysis_logistic_manager.dart';
import 'package:administration_app/interactor/storage/storage_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/common/snack_bar.dart';
import 'package:administration_app/ui/router.dart';

class SplashScreenWm extends WidgetModelStandard {

  final _appRouter = getIt<AppRouter>();
  final _storageManager = getIt<StorageManager>();
  final _analysisLogisticManager = getIt<AnalysisLogisticManager>();

  @override
  void onInit()async{
    final login = await _storageManager.getString(key: 'login');
    print(login);
    final password = await _storageManager.getString(key: 'password');
    print(password);
    if(login == null &&password == null) {
      _appRouter.replaceNamed(RouteScreen.auth);
    }
    else {
      doFutureHandleError(_analysisLogisticManager.getVehicle());
      doFutureHandleError(_analysisLogisticManager.getTypeOfVehicle(), onValue: (_){
        _appRouter.replaceNamed(RouteScreen.chooseTreatment);
      }, onError: (e,s){
        showSnackBarError(error: 'Ошибка получения транспортных средств');
      });
    }
  }
}