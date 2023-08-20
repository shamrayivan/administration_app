import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/interactor/storage/storage_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/common/snack_bar.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class SplashScreenWm extends WidgetModelStandard {

  final _appRouter = getIt<AppRouter>();
  final _storageManager = getIt<StorageManager>();
  final _mainManager = getIt<MainManager>();
  final errorState = StreamedStateNS<bool>(false);
  final vehiclesErrorState = StreamedState<bool>();
  final typeOfVehiclesErrorState = StreamedState<bool>();
  final driversErrorState = StreamedState<bool>();
  final loadingState = StreamedStateNS<bool>(false);

  final onRestart = Action<void>();

  @override
  void onInit()async{
    final login = await _storageManager.getString(key: 'login');
    final password = await _storageManager.getString(key: 'password');
    if(login == null &&password == null) {
      _appRouter.replaceNamed(RouteScreen.auth);
    }
    else {
      doFutureHandleError(_mainManager.getVehicle(),
          onValue: (val){
        vehiclesErrorState.accept(false);
          },
          onError: (e,s){
        showSnackBarError(error: 'Ошибка получения транспортных средств');
        vehiclesErrorState.accept(true);
        errorState.accept(true);
      });
      doFutureHandleError(_mainManager.getTypeOfVehicle(),
          onValue: (val){
            typeOfVehiclesErrorState.accept(false);
          },
          onError: (e,s){
        showSnackBarError(error: 'Ошибка получения типов транспортных средств');
        typeOfVehiclesErrorState.accept(true);
        errorState.accept(true);
      });
      doFutureHandleError(_mainManager.getDrivers(),
          onValue: (val){
            driversErrorState.accept(false);
          },
          onError: (e,s){
        showSnackBarError(error: 'Ошибка получения водителей');
        driversErrorState.accept(true);
        errorState.accept(true);
      });
    }
  }

  @override
  void onBind() {
    subscribe(onRestart.stream, (value) async {
      driversErrorState.accept(false);
      onInit();
    });
    subscribe(driversErrorState.stream, (value) {
      if(driversErrorState.value !=null && vehiclesErrorState.value!=null && typeOfVehiclesErrorState.value!=null) {
        if (!driversErrorState.value! && !vehiclesErrorState.value! &&
            !typeOfVehiclesErrorState.value!) {
          _appRouter.replaceNamed(RouteScreen.chooseTreatment);
        }
      }
    });
    subscribe(vehiclesErrorState.stream, (value) {
      if(driversErrorState.value !=null && vehiclesErrorState.value!=null && typeOfVehiclesErrorState.value!=null) {
        if (!driversErrorState.value! && !vehiclesErrorState.value! &&
            !typeOfVehiclesErrorState.value!) {
          _appRouter.replaceNamed(RouteScreen.chooseTreatment);
        }
      }
    });
    subscribe(typeOfVehiclesErrorState.stream, (value) {
      if(driversErrorState.value !=null && vehiclesErrorState.value!=null && typeOfVehiclesErrorState.value!=null) {
        if (!driversErrorState.value! && !vehiclesErrorState.value! &&
            !typeOfVehiclesErrorState.value!) {
          _appRouter.replaceNamed(RouteScreen.chooseTreatment);
        }
      }
    });
  }
}