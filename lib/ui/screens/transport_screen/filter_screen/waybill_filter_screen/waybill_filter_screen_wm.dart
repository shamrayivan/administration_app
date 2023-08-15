import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class WaybillFilterScreenWM extends WidgetModelStandard {
  final vehiclesStreamedState = getIt<TransportManager>().vehiclesWaybillsStreamedState;
  final analysisLogisticManager = getIt<TransportManager>();
  final mainManager = getIt<MainManager>();

  final _appRouter = getIt<AppRouter>();

  final loadingState = StreamedStateNS<bool>(false);

  final onDisableAll = Action<void>();
  final onEnableAll = Action<void>();
  final onSave = Action<void>();
  final onBack = Action<void>();
  final onChangeTypeOfVehicle = Action<Vehicles>();
  final onChangeVehicle = Action<Vehicles>();
  final onShowRetired = Action<bool>();
  final showRetiredState = StreamedStateNS<bool>(true);

  List<Vehicles>? saveVehicles = <Vehicles>[];

  @override
  void onInit() {
    mainManager.typeOfVehicle.data?.forEach((value) {
      vehiclesStreamedState.value?.forEach((element) {
        if ( value.type == element.vehicleName) {
          final Set<bool> listSelected = {};
          vehiclesStreamedState.value?.forEach((element2) {
            if (element2.parentType == element.vehicleName) {
              listSelected.add(element2.selected);
            }
          });
          if (listSelected.contains(false)) {
            element.selected = false;
          } else
            element.selected = true;
        }
      });
    });
    mainManager.vehicles.data?.forEach((element) {
      saveVehicles?.add(Vehicles(
          itsGroup: element.itsGroup,
          parentType: element.parentType,
          selected: element.selected,
          dateRetired: element.dateRetired,
          vehicleName: element.vehicleName));
    });
  }

  @override
  void onBind() {
    subscribe(onShowRetired.stream, (value) {
      showRetiredState.accept(value!);
      vehiclesStreamedState.value?.forEach((element) {
        if (element.dateRetired != 0) {
          element.selected = value;
        }
      });
      vehiclesStreamedState.reAccept();
    });
    subscribe(onBack.stream, (value) async {
      _appRouter.pop();
      vehiclesStreamedState.accept(saveVehicles);
    });
    subscribe(onSave.stream, (value) {
      loadingState.accept(true);
      final data = <Map<String, dynamic>>[];
      vehiclesStreamedState.value?.forEach((element) {
        if (element.selected) {
          data.add({'Наименование': element.vehicleName});
        }
      });
      logger(data.length);
      doFutureHandleError(analysisLogisticManager.getAnalysisLogistic(modeID: 2, data: data),
          onValue: (_) {
        _appRouter.pop();
        loadingState.accept(false);
      }, onError: (e, s) {
        loadingState.accept(false);
      });
    });
    subscribe(onChangeVehicle.stream, (value) {
      vehiclesStreamedState.value?.forEach((element) {
        if (value?.vehicleName == element.vehicleName) {
          element.selected = !element.selected;
        }
      });
      vehiclesStreamedState.value?.forEach((element) {
        if (value!.parentType.isNotEmpty && value.parentType == element.vehicleName) {
          final Set<bool> listSelected = {};
          vehiclesStreamedState.value?.forEach((element2) {
            if (element2.parentType == element.vehicleName) {
              listSelected.add(element2.selected);
            }
          });
          if (listSelected.contains(false)) {
            element.selected = false;
          } else
            element.selected = true;
        }
      });
      vehiclesStreamedState.reAccept();
    });
    subscribe(onChangeTypeOfVehicle.stream, (value) {
      vehiclesStreamedState.value?.forEach((element) {
        if (value?.vehicleName == element.parentType) {
          element.selected = !value!.selected;
        }
      });
      vehiclesStreamedState.value?.forEach((element) {
        if (value?.vehicleName == element.vehicleName) {
          element.selected = !value!.selected;
        }
      });
      vehiclesStreamedState.reAccept();
    });
    subscribe(onDisableAll.stream, (value) {
      final List<Vehicles> newListVehicles = [];
      for (int i = 0; i < vehiclesStreamedState.value!.length; i++) {
        newListVehicles.add(Vehicles(
            itsGroup: vehiclesStreamedState.value![i].itsGroup,
            parentType: vehiclesStreamedState.value![i].parentType,
            selected: false,
            dateRetired: vehiclesStreamedState.value![i].dateRetired,
            vehicleName: vehiclesStreamedState.value![i].vehicleName));
      }
      vehiclesStreamedState.accept(newListVehicles);
      // onInit();
    });
    subscribe(onEnableAll.stream, (value) {
      final List<Vehicles> newListVehicles = [];
      for (int i = 0; i < vehiclesStreamedState.value!.length; i++) {
        newListVehicles.add(Vehicles(
            itsGroup: vehiclesStreamedState.value![i].itsGroup,
            parentType: vehiclesStreamedState.value![i].parentType,
            selected: true,
            dateRetired: vehiclesStreamedState.value![i].dateRetired,
            vehicleName: vehiclesStreamedState.value![i].vehicleName));
      }
      vehiclesStreamedState.accept(newListVehicles);
      // onInit();
    });
  }
}
