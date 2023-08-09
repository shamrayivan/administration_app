import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class AnalyseLogisticsScreenWM extends WidgetModelStandard {
  final selectedToggle = StreamedStateNS([true, false, false]);
  final List<Widget> toggleWidgets = [Text(' По заказам '), Text(' По путевым листам '), Text(' По заданиям ')];
  final onChangeToggle = Action<int>();

  @override
  void onBind() {
    subscribe(onChangeToggle.stream, (index) {
      List<bool> listBool = [false, false, false];
      listBool[index!] = true;
      selectedToggle.accept(listBool);
    });
  }

}