import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class GSMScreenWM extends WidgetModelStandard {

  final currentBottomBarIndexState = StreamedStateNS<int>(0);
  final onChooseBottomBarIndex = Action<int>();
  final scaffoldKey = getIt<GlobalKey<ScaffoldState>>();
  final hideRetiredState = getIt<GSMManager>().hideRetiredState;

  @override
  void onBind() {
    subscribe(onChooseBottomBarIndex.stream, (value) {
      currentBottomBarIndexState.accept(value!);
    });
  }

}