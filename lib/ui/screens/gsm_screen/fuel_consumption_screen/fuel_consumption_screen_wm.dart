import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:administration_app/ui/common/bottom_sheet_select/bottom_sheet_select.dart';
import 'package:administration_app/ui/common/snack_bar.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class FuelConsumptionScreenWM extends WidgetModelStandard {
  final _scaffoldKey = getIt<GlobalKey<ScaffoldState>>();

  final _appRouter = getIt<AppRouter>();

  final _gsmManager = getIt<GSMManager>();

  final listVehicles = getIt<MainManager>().vehicles;
  final listDrivers = getIt<MainManager>().drivers;

  final selectedToggle = getIt<GSMManager>().selectedToggle;
  final currentToggle = getIt<GSMManager>().currentToggle;
  final List<Widget> toggleWidgets = getIt<GSMManager>().toggleWidgets;
  final onChangeToggle = Action<int>();

  final dateBeginState = getIt<GSMManager>().dateBeginState;
  final dateEndState = getIt<GSMManager>().dateEndState;

  final onGetData = Action<void>();

  final onDateBegin = Action<DateTime>();
  final onDateEnd = Action<DateTime>();
  final onChooseVehicleOrder = Action<void>();
  final onChooseVehicleWaybill = Action<void>();
  final onChooseDriverTask = Action<void>();

  final choosenVehicleOrder = StreamedStateNS<String>('Выберите ТС');
  final choosenVehicleWaybill = StreamedStateNS<String>('Выберите ТС');
  final choosenDriverTask = StreamedStateNS<String>('Выберите Водителя');
  final recentlyChoosenVehicle = StreamedStateNS<List<String>>([]);
  final recentlyChoosenDriver = StreamedStateNS<List<String>>([]);

  final onChooseRecently = Action<String>();

  final loadingState = StreamedStateNS<bool>(false);

  @override
  void onBind() {
    subscribe(onChooseRecently.stream, (value) {
      if(currentToggle.value==0){
        choosenVehicleOrder.accept(value??'');
      }else if (currentToggle.value==1){
        choosenVehicleWaybill.accept(value??'');
      }else if (currentToggle.value == 2){
        choosenDriverTask.accept(value??'');
      }
    });
    subscribe(onGetData.stream, (value) {
      if (currentToggle.value == 0) {
        if (choosenVehicleOrder.value == 'Выберите ТС') {
          showSnackBarError(error: 'Выберите ТС');
          return;
        }
        loadingState.accept(true);
        doFutureHandleError(_gsmManager.getFuelGraphVehicle(
            mode: 1,
            dateBegin: dateBeginState.value.millisecondsSinceEpoch.toString(),
            dateEnd: dateEndState.value.millisecondsSinceEpoch.toString(),
            vehicle: choosenVehicleOrder.value), onValue: (val){
          loadingState.accept(false);
          _appRouter.push(GraphFuelConsumptionRoute(mode: 1, data: choosenVehicleOrder.value));
        });
      }
      if (currentToggle.value == 1) {
        if (choosenVehicleWaybill.value == 'Выберите ТС') {
          showSnackBarError(error: 'Выберите ТС');
          return;
        }
        loadingState.accept(true);
        doFutureHandleError(_gsmManager.getFuelGraphVehicle(
            mode: 2,
            dateBegin: dateBeginState.value.millisecondsSinceEpoch.toString(),
            dateEnd: dateEndState.value.millisecondsSinceEpoch.toString(),
            vehicle: choosenVehicleWaybill.value), onValue: (val){
          loadingState.accept(false);
          _appRouter.push(GraphFuelConsumptionRoute(mode: 2, data: choosenVehicleWaybill.value));
        });
      }
      if (currentToggle.value == 2) {
        if (choosenDriverTask.value == 'Выберите Водителя') {
          showSnackBarError(error: 'Выберите Водителя');
          return;
        }
        loadingState.accept(true);
        doFutureHandleError(_gsmManager.getFuelGraphDriver(
            dateBegin: dateBeginState.value.millisecondsSinceEpoch.toString(),
            dateEnd: dateEndState.value.millisecondsSinceEpoch.toString(),
            driver: choosenDriverTask.value), onValue: (val){
          loadingState.accept(false);
          _appRouter.push(GraphFuelConsumptionRoute(mode: 3, data: choosenDriverTask.value));
        });
      }
    });
    //Изменение кнопки переключения
    subscribe(onChangeToggle.stream, (index) {
      currentToggle.accept(index!);
      List<bool> listBool = [false, false, false];
      listBool[index] = true;
      selectedToggle.accept(listBool);
    });
    subscribe(onChooseVehicleOrder.stream, (value) async {
      if (listVehicles.value.isContent) {
        List<String> newListVehicle = [];
        listVehicles.data?.forEach((element) {
          if (!element.itsGroup) newListVehicle.add(element.vehicleName);
        });
        final a = await bottomSheetSelect(
            context: _scaffoldKey.currentContext!,
            title: 'Выберите транспортное средство',
            data: newListVehicle,
            currentListData: [choosenVehicleOrder.value ?? ''],
            isSeveral: false,
            withoutConfirmation: true);
        if (a != null) {
          choosenVehicleOrder.accept(a.first);
          recentlyChoosenVehicle.value.insert(0, a.first);
          recentlyChoosenVehicle.reAccept();
        }
      }
    });
    subscribe(onChooseVehicleWaybill.stream, (value) async {
      if (listVehicles.value.isContent) {
        List<String> newListVehicle = [];
        listVehicles.data?.forEach((element) {
          if (!element.itsGroup) newListVehicle.add(element.vehicleName);
        });
        final a = await bottomSheetSelect(
            context: _scaffoldKey.currentContext!,
            title: 'Выберите транспортное средство',
            data: newListVehicle,
            currentListData: [choosenVehicleWaybill.value ?? ''],
            isSeveral: false,
            withoutConfirmation: true);
        if (a != null) {
          choosenVehicleWaybill.accept(a.first);
          recentlyChoosenVehicle.value.insert(0, a.first);
          recentlyChoosenVehicle.reAccept();
        }
      }
    });
    subscribe(onChooseDriverTask.stream, (value) async {
      if (listDrivers.value.isContent) {
        List<String> newListDrivers = [];
        listDrivers.data?.forEach((element) {
          newListDrivers.add(element.drivername);
        });
        final a = await bottomSheetSelect(
            context: _scaffoldKey.currentContext!,
            title: 'Выберите транспортное средство',
            data: newListDrivers,
            currentListData: [choosenDriverTask.value ?? ''],
            isSeveral: false,
            withoutConfirmation: true);
        if (a != null) {
          choosenDriverTask.accept(a.first);
          recentlyChoosenDriver.value.insert(0, a.first);
          recentlyChoosenDriver.reAccept();
        }
      }
    });
    subscribe(onDateBegin.stream, (value) async {
      final newDateBegin = await showDatePicker(
        context: _scaffoldKey.currentContext!,
        initialDate: value!,
        firstDate: DateTime(2018),
        lastDate: dateEndState.value,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.amberAccent,
                onPrimary: Colors.black,
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (newDateBegin != null) {
        dateBeginState.accept(newDateBegin);
      }
    });
    subscribe(onDateEnd.stream, (value) async {
      final newDateEnd = await showDatePicker(
        context: _scaffoldKey.currentContext!,
        initialDate: value!,
        firstDate: dateBeginState.value,
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.amberAccent,
                onPrimary: Colors.black,
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
      );
      if (newDateEnd != null) {
        dateEndState.accept(newDateEnd);
      }
    });
  }
}
