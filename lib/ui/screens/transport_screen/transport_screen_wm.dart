import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/analysis_logistic/analysis_logistic_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class TransportScreenWM extends WidgetModelStandard {

  final currentBottomBarIndexState = StreamedStateNS<int>(0);
  final onChooseBottomBarIndex = Action<int>();
  final scaffoldKey = getIt<GlobalKey<ScaffoldState>>();
  final _analysisLogisticManager = getIt<AnalysisLogisticManager>();
  final _appRouter = getIt<AppRouter>();

  final onFilter = Action<void>();

  @override
  void onInit(){
    if (_analysisLogisticManager.typeOfVehicle.value.isContent){
      final data = <Map<String, dynamic>>[];
      _analysisLogisticManager.typeOfVehicle.data?.forEach((element) {data.add({'Наименование' : element.type});});
      doFutureHandleError(_analysisLogisticManager.getAnalysisLogistic(modeID: 1, data: data));
    }
  }

  @override
  void onBind(){
    subscribe(onFilter.stream, (_) {
      switch(_analysisLogisticManager.currentToggle.value){
        case 0 :
          _appRouter.pushNamed(RouteScreen.filterOrderAnalysisLogistics);
        case 1 :
          _appRouter.pushNamed(RouteScreen.filterWaybillAnalysisLogistics);
        case 2 :
          _appRouter.pushNamed(RouteScreen.filterTaskAnalysisLogistics);
      }
    });
    //кнопка переключения Bottom Bara
    subscribe(onChooseBottomBarIndex.stream, (value) {
      currentBottomBarIndexState.accept(value!);
    });

  }
}