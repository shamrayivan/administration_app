import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/analysis_logistic/analysis_logistic_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class OrderFilterScreenWM extends WidgetModelStandard {
  final analysisLogisticManager = getIt<AnalysisLogisticManager>();
  final typesOfVehicleStreamedState = getIt<AnalysisLogisticManager>().typesOfVehicleStreamedState;

  final _appRouter = getIt<AppRouter>();

  final loadingState = StreamedStateNS<bool>(false);

  final onDisableAll = Action<void>();
  final onEnableAll = Action<void>();
  final onChangeSelected = Action<TypeOfVehicle>();
  final onChangeSelectedGroup = Action<TypeOfVehicle>();
  final onSave = Action<void>();
  final onBack = Action<void>();
  List<TypeOfVehicle>? saveTypeOfVehicle = <TypeOfVehicle>[];

  @override
  void onInit() {
    analysisLogisticManager.typeOfVehicle.data?.forEach((element) {
      saveTypeOfVehicle?.add(TypeOfVehicle(
          itsGroup: element.itsGroup,
          type: element.type,
          parentType: element.parentType,
          selected: element.selected));
    });
  }

  @override
  void onBind() {
    subscribe(onBack.stream, (value) async {
      _appRouter.pop();
      typesOfVehicleStreamedState.accept(saveTypeOfVehicle);
    });
    subscribe(onSave.stream, (value) {
      loadingState.accept(true);
      final data = <Map<String, dynamic>>[];
      typesOfVehicleStreamedState.value?.forEach((element) {
        if (element.selected) {
          data.add({'Наименование': element.type});
        }
      });
      doFutureHandleError(analysisLogisticManager.getAnalysisLogistic(modeID: 1, data: data),
          onValue: (_) {
        _appRouter.pop();
        loadingState.accept(false);
      }, onError: (e, s) {
        loadingState.accept(false);
      });
    });
    subscribe(onChangeSelectedGroup.stream, (value) {
      typesOfVehicleStreamedState.value?.forEach((element) {
        if (element.type == value?.type) {
          element.selected = !value!.selected;
        }
        if (element.parentType == value?.type) {
          element.selected = value!.selected;
        }
      });
      typesOfVehicleStreamedState.reAccept();
    });
    subscribe(onChangeSelected.stream, (value) {
      typesOfVehicleStreamedState.value?.forEach((element) {
        if (element.type == value?.type) {
          element.selected = !value!.selected;
        }
      });
      typesOfVehicleStreamedState.value?.forEach((element) {
        if (value!.parentType.isNotEmpty && value.parentType == element.type) {
          final Set<bool> listSelected = {};
          typesOfVehicleStreamedState.value?.forEach((element2) {
            if (element2.parentType == element.type) {
              listSelected.add(element2.selected);
            }
          });
          print(listSelected);
          if (listSelected.contains(false)) {
            element.selected = false;
          } else
            element.selected = true;
        }
      });
      typesOfVehicleStreamedState.reAccept();
    });
    subscribe(onDisableAll.stream, (value) {
      final List<TypeOfVehicle> newListTypeOfVehicle = [];
      for (int i = 0; i < typesOfVehicleStreamedState.value!.length; i++) {
        newListTypeOfVehicle.add(TypeOfVehicle(
            itsGroup: typesOfVehicleStreamedState.value![i].itsGroup,
            type: typesOfVehicleStreamedState.value![i].type,
            parentType: typesOfVehicleStreamedState.value![i].parentType,
            selected: false));
      }
      typesOfVehicleStreamedState.accept(newListTypeOfVehicle);
    });
    subscribe(onEnableAll.stream, (value) {
      final List<TypeOfVehicle> newListTypeOfVehicle = [];
      for (int i = 0; i < typesOfVehicleStreamedState.value!.length; i++) {
        newListTypeOfVehicle.add(TypeOfVehicle(
            itsGroup: typesOfVehicleStreamedState.value![i].itsGroup,
            type: typesOfVehicleStreamedState.value![i].type,
            parentType: typesOfVehicleStreamedState.value![i].parentType,
            selected: true));
      }
      typesOfVehicleStreamedState.accept(newListTypeOfVehicle);
    });
  }
}
