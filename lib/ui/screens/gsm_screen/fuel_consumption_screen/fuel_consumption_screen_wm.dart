import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:administration_app/ui/common/bottom_sheet_select/bottom_sheet_select.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class FuelConsumptionScreenWM extends WidgetModelStandard {
  final _scaffoldKey = getIt<GlobalKey<ScaffoldState>>();

  final listVehicles = getIt<MainManager>().vehicles;

  final selectedToggle = getIt<GSMManager>().selectedToggle;
  final currentToggle = getIt<GSMManager>().currentToggle;
  final List<Widget> toggleWidgets = getIt<GSMManager>().toggleWidgets;
  final onChangeToggle = Action<int>();

  final dateBeginState = getIt<GSMManager>().dateBeginState;
  final dateEndState = getIt<GSMManager>().dateEndState;

  final onDateBegin = Action<DateTime>();
  final onDateEnd = Action<DateTime>();
  final onChooseVehicle = Action<void>();

  final choosenVehicle = StreamedState<String>();

  @override
  void onBind() {
    //Изменение кнопки переключения
    subscribe(onChangeToggle.stream, (index) {
      currentToggle.accept(index!);
      List<bool> listBool = [false, false, false];
      listBool[index] = true;
      selectedToggle.accept(listBool);
    });
    subscribe(onChooseVehicle.stream, (value) async {
      if(listVehicles.value.isContent) {
        List<String> newListVehicle = [];
        listVehicles.data?.forEach((element) {if(!element.itsGroup) newListVehicle.add(element.vehicleName);});
        final a = await bottomSheetSelect(
            context: _scaffoldKey.currentContext!,
            title: 'Выберите транспортное средство',
            data: newListVehicle,
            currentListData: [],
            isSeveral: false,
            withoutConfirmation: true);
        if (a != null) {
          choosenVehicle.accept(a.first);
        }
      }
    });
  }
}
