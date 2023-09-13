import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/ui/common/bottom_sheet_select_standart/bottom_sheet_select_standart.dart';
import 'package:administration_app/ui/common/snack_bar.dart';
import 'package:administration_app/ui/res/const_colors.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class TableFuelConsumptionScreenWM extends WidgetModelStandard {
  final _scaffoldKey = getIt<GlobalKey<ScaffoldState>>();
  final _mainManager = getIt<MainManager>();
  final hideRetired = getIt<GSMManager>().hideRetiredState;
  final _gsmManager = getIt<GSMManager>();
  final _appRouter = getIt<AppRouter>();

  final typeOfVehicleState = StreamedStateNS<List<TypeOfVehicle>>([]);

  final yearController = TextEditingController();

  final modeState = StreamedStateNS<bool>(true);
  final periodicState = StreamedStateNS<String>('Месяц');
  final onPeriod = Action<void>();
  final onGetData = Action<void>();

  final dateBeginState = StreamedStateNS<DateTime>(DateTime(DateTime.now().year, DateTime.now().month - 1, 1));
  final dateEndState = StreamedStateNS<DateTime>(DateTime(DateTime.now().year, DateTime.now().month, 0));
  final onDateBegin = Action<DateTime>();
  final onDateEnd = Action<DateTime>();

  final loadingState = StreamedStateNS<bool>(false);

  final List<String> listPeriod = ['Неделя', 'Месяц'];

  @override
  void onInit() {
    _mainManager.vehicles.data?.forEach((element) {
      if (element.itsGroup &&
          (element.vehicleName == 'ИП' ||
              element.vehicleName == 'Служебный' ||
              element.vehicleName == 'Прицепы')) {
        typeOfVehicleState.value.add(TypeOfVehicle(
            itsGroup: element.itsGroup,
            type: element.vehicleName,
            parentType: element.parentType,
            selected: false));
      } else if (element.itsGroup) {
        typeOfVehicleState.value.add(TypeOfVehicle(
            itsGroup: element.itsGroup,
            type: element.vehicleName,
            parentType: element.parentType,
            selected: true));
      }
    });
  }

  @override
  void onBind() {
    subscribe(onGetData.stream, (value) {
      if (modeState.value) {
        FocusManager.instance.primaryFocus?.unfocus();
        if (yearController.text.isEmpty) {
          showSnackBarError(error: 'Введите нужный год');
          return;
        }
        if (2018 > int.parse(yearController.text) ||
            int.parse(yearController.text) > DateTime.now().year) {
          showSnackBarError(error: 'Выберите корректный год');
          return;
        }
        final List<Map<String, dynamic>> data = [];
        typeOfVehicleState.value.forEach((element) {
          data.add({'Показывать': element.selected, 'Наименование': element.type});
        });
        loadingState.accept(true);
        doFutureHandleError(
            _gsmManager.getFuelTableData(
                data: data,
                period: periodicState.value,
                mode: 2,
                hideRetired: hideRetired.value,
                year: yearController.text), onValue: (val) {
          loadingState.accept(false);
          _appRouter.pushNamed(RouteScreen.fullTableFuelConsumption);
        }, onError: (e, s) {
          loadingState.accept(false);
        });
      } else {
        final List<Map<String, dynamic>> data = [];
        typeOfVehicleState.value.forEach((element) {
          data.add({'Показывать': element.selected, 'Наименование': element.type});
        });
        loadingState.accept(true);
        doFutureHandleError(_gsmManager.getFuelTableData(
            data: data,
            period: periodicState.value,
            mode: 1,
            hideRetired: hideRetired.value,
            dateBegin: dateBeginState.value.millisecondsSinceEpoch.toString(),
            dateEnd: dateEndState.value.millisecondsSinceEpoch.toString()),
            onValue: (val) {
              loadingState.accept(false);
              _appRouter.pushNamed(RouteScreen.fullTableFuelConsumption);
            }, onError: (e, s) {
              loadingState.accept(false);
            });
      }
    });
    subscribe(onPeriod.stream, (value) async {
      final period = await bottomSheetSelectStandart(
          context: _scaffoldKey.currentContext!,
          title: 'Выберите период',
          data: listPeriod,
          currentListData: [periodicState.value],
          isSeveral: false,
          withoutConfirmation: true);
      if (period != null) {
        periodicState.accept(period.first);
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
                onPrimary: blackColor,
                onSurface: blackColor, // body text color
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
