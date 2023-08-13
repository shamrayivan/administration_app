import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/analysis_logistic/analysis_logistic_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class EfficiencyTransportFilterScreenWM extends WidgetModelStandard {
  final vehiclesStreamedState =
      getIt<AnalysisLogisticManager>().vehiclesEfficiencyTransportStreamedState;
  final analysisLogisticManager = getIt<AnalysisLogisticManager>();

  final _scaffoldKey = getIt<GlobalKey<ScaffoldState>>();

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

  final onDateBegin = Action<DateTime>();
  final onDateEnd = Action<DateTime>();

  final dateBeginState = getIt<AnalysisLogisticManager>().dateBeginState;
  final dateEndState = getIt<AnalysisLogisticManager>().dateEndState;

  List<Vehicles>? saveVehicles = <Vehicles>[];

  @override
  void onInit() {
    analysisLogisticManager.typeOfVehicle.data?.forEach((value) {
      vehiclesStreamedState.value?.forEach((element) {
        if (value.type == element.vehicleName) {
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
    analysisLogisticManager.vehicles.data?.forEach((element) {
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
    subscribe(onDateBegin.stream, (value) async {
      final newDateBegin = await showDatePicker(
          context: _scaffoldKey.currentContext!,
          initialDate: value!,
          firstDate: DateTime(2018),
          lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.amberAccent,
                onPrimary: Colors.black,
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme:
              TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },);
      if (newDateBegin != null) {
        dateBeginState.accept(newDateBegin);
      }
    });
    subscribe(onDateEnd.stream, (value) async {
      final newDateEnd = await showDatePicker(
        context: _scaffoldKey.currentContext!,
        initialDate: value!,
        firstDate: DateTime(2018),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.amberAccent,
                onPrimary: Colors.black,
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme:
              TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },);
      if (newDateEnd != null) {
        dateEndState.accept(newDateEnd);
      }
    });
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
      doFutureHandleError(analysisLogisticManager.getEfficiencyTransport( data: data, dateBegin: dateBeginState.value, dateEnd: dateEndState.value),
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
