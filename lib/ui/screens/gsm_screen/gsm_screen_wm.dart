import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class GSMScreenWM extends WidgetModelStandard {

  final currentBottomBarIndexState = StreamedStateNS<int>(0);
  final onChooseBottomBarIndex = Action<int>();
  final scaffoldKey = getIt<GlobalKey<ScaffoldState>>();
  final _analysisLogisticManager = getIt<TransportManager>();
  final _appRouter = getIt<AppRouter>();

}