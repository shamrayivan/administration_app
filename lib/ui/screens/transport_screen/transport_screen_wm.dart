import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class TransportScreenWM extends WidgetModelStandard {
  final currentBottomBarIndexState = StreamedStateNS<int>(0);
  final onChooseBottomBarIndex = Action<int>();
  final scaffoldKey = getIt<GlobalKey<ScaffoldState>>();
  final _analysisLogisticManager = getIt<TransportManager>();
  final _mainManager = getIt<MainManager>();
  final _appRouter = getIt<AppRouter>();

  final onFilter = Action<void>();

  @override
  void onInit() {
    if (_mainManager.typeOfVehicle.value.isContent) {
      if (!_analysisLogisticManager.orderAnalisysLogistic.value.isContent) {
        final data = <Map<String, dynamic>>[];
        _mainManager.typeOfVehicle.data?.forEach((element) {
          data.add({'Наименование': element.type});
        });
        doFutureHandleError(_analysisLogisticManager.getAnalysisLogistic(modeID: 1, data: data));
      }
    }
    if (_mainManager.vehicles.value.isContent) {
      if (!_analysisLogisticManager.efficiencyTransportState.value.isContent) {
        final data = <Map<String, dynamic>>[];
        _mainManager.vehicles.data?.forEach((element) {
          data.add({'Наименование': element.vehicleName});
        });
        doFutureHandleError(
          _analysisLogisticManager.getEfficiencyTransport(
            data: data,
            dateBegin: DateTime(2021, 04, 1),
            dateEnd: DateTime(2021, 04, 30),
          ),
        );
      }
    }
  }

  @override
  void onBind() {
    subscribe(onFilter.stream, (_) {
      if(currentBottomBarIndexState.value == 0) {
        switch (_analysisLogisticManager.currentToggle.value) {
        case 0:
          _appRouter.pushNamed(RouteScreen.filterOrderAnalysisLogistics);
        case 1:
          _appRouter.pushNamed(RouteScreen.filterWaybillAnalysisLogistics);
        case 2:
          _appRouter.pushNamed(RouteScreen.filterTaskAnalysisLogistics);
      }
      }
      else if (currentBottomBarIndexState.value == 1){
        _appRouter.pushNamed(RouteScreen.filterEfficiencyTransportAnalysisLogistics);
      }
    });
    //кнопка переключения Bottom Bara
    subscribe(onChooseBottomBarIndex.stream, (value) {
      print(value);
      currentBottomBarIndexState.accept(value!);
    });
  }
}
