import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/analysis_logistic/analysis_logistic_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class AnalyseLogisticsScreenWM extends WidgetModelStandard {
  final selectedToggle = StreamedStateNS<List<bool>>([true, false, false]);
  final currentToggle = getIt<AnalysisLogisticManager>().currentToggle;
  final List<Widget> toggleWidgets = [
    Text(' По заказам '),
    Text(' По путевым листам '),
    Text(' По заданиям ')
  ];
  final onChangeToggle = Action<int>();
  final analysisLogisticManager = getIt<AnalysisLogisticManager>();

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
        final data = <Map<String, dynamic>>[];
        analysisLogisticManager.typeOfVehicle.data?.forEach((element) {
          data.add({'Наименование': element.type});
        });
        doFutureHandleError(
            analysisLogisticManager.getAnalysisLogistic(modeID: modeID, data: data));
      case 2:
        final data = <Map<String, dynamic>>[];
        analysisLogisticManager.vehicles.data?.forEach((element) {
          if (!element.itsGroup) data.add({'Наименование': element.vehicleName});
        });
        doFutureHandleError(
            analysisLogisticManager.getAnalysisLogistic(modeID: modeID, data: data));
      case 3:
        final data = <Map<String, dynamic>>[];
        analysisLogisticManager.vehicles.data?.forEach((element) {
          if (!element.itsGroup) data.add({'Наименование': element.vehicleName});
        });
        doFutureHandleError(
            analysisLogisticManager.getAnalysisLogistic(modeID: modeID, data: data));
    }
  }
}
