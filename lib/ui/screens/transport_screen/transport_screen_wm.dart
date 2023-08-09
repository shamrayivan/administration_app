import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class TransportScreenWM extends WidgetModelStandard {

  final currentBottomBarIndexState = StreamedStateNS<int>(0);
  final onChooseBottomBarIndex = Action<int>();
  final scaffoldKey = getIt<GlobalKey<ScaffoldState>>();

  @override
  void onBind(){
    subscribe(onChooseBottomBarIndex.stream, (value) {
      currentBottomBarIndexState.accept(value!);
    });
  }
}