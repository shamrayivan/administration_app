import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class AnalyseLogisticsScreenWM extends WidgetModelStandard {
  final selectedToggle = getIt<TransportManager>().selectedToggle;
  final currentToggle = getIt<TransportManager>().currentToggle;
  final List<Widget> toggleWidgets = getIt<TransportManager>().toggleWidgets;
  final onChangeToggle = Action<int>();
  final analysisLogisticManager = getIt<TransportManager>();
  final mainManager = getIt<MainManager>();

  @override
  void onBind() {
    //Изменение кнопки переключения
    subscribe(onChangeToggle.stream, (index) {
      _callNewAnalysisLogisticData(modeID: index! + 1);
      currentToggle.accept(index);
      List<bool> listBool = [false, false, false];
      listBool[index] = true;
      selectedToggle.accept(listBool);
    });
  }
  //функция http запроса в зависимости от выбранного типа
  _callNewAnalysisLogisticData({required int modeID}) {
    switch (modeID) {
      case 1:
        if(analysisLogisticManager.orderAnalisysLogistic.data == null) {
          final data = <Map<String, dynamic>>[];
          mainManager.typeOfVehicle.data?.forEach((element) {
            data.add({'Наименование': element.type});
          });
          doFutureHandleError(
              analysisLogisticManager.getAnalysisLogistic(modeID: modeID, data: data));
        }
      case 2:
        if(analysisLogisticManager.waybillAnalisysLogistic.data == null) {
          final data = <Map<String, dynamic>>[];
          mainManager.vehicles.data?.forEach((element) {
            if (!element.itsGroup) data.add({'Наименование': element.vehicleName});
          });
          doFutureHandleError(
              analysisLogisticManager.getAnalysisLogistic(modeID: modeID, data: data));
        }
      case 3:
        if(analysisLogisticManager.taskAnalisysLogistic.data == null) {
          final data = <Map<String, dynamic>>[];
          mainManager.vehicles.data?.forEach((element) {
            if (!element.itsGroup) data.add({'Наименование': element.vehicleName});
          });
          doFutureHandleError(
              analysisLogisticManager.getAnalysisLogistic(modeID: modeID, data: data));
        }
    }
  }
}
