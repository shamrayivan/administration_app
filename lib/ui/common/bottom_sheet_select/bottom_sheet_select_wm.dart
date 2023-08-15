import 'dart:math';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class BottomSheetSelectWM extends WidgetModelStandard {
  BottomSheetSelectWM({
    required this.title,
    required this.data,
    required this.currentListData,
    required this.isSeveral,
    required this.initialChildSize,
    required this.withoutConfirmation,
    required this.isCancelSelect,
  }) : dataListState = StreamedStateNS<List<String>>(currentListData);

  final _appRouter = getIt<AppRouter>();

  final double? initialChildSize;

  final String title;
  final List<String> data;
  final List<String> currentListData;
  final bool isSeveral;
  final bool withoutConfirmation;
  final bool isCancelSelect;

  final searchController = TextEditingController();
  final onChangeController = Action<String>();

  final StreamedStateNS<List<String>> dataListState;
  final  dataState = StreamedStateNS<List<String>>([]);

  final onSelect = Action<String>();
  final onOk = Action<void>();
  final onBack = Action<void>();
  List<String> saveData =[];

  @override
  void onInit() {
    data.forEach((element) {
      saveData.add(element);
      dataState.value.add(element);
    });
    dataState.reAccept();
  }

  @override
  void onBind() {
    subscribe(onChangeController.stream, (value) async {
      dataState.value.clear();
      await dataState.accept(dataState.value);
      // saveData.forEach((element) {data.add(element);});
      dataState.value.addAll(saveData.where(
                (element) {
                  return element.trim().toLowerCase().contains('${value?.toLowerCase()}');}));
        print(data);
    });
    subscribe<void>(onOk.stream, (_) => _appRouter.pop(dataListState.value));
    subscribe<void>(onBack.stream, (_) => _appRouter.pop());
    subscribe<String>(
      onSelect.stream,
          (val) {
        if (val == null) return;
        if (withoutConfirmation) {
          _appRouter.pop([val]);
          return;
        }

        if (isSeveral) {
          final dataList = dataListState.value;
          dataList.contains(val)
              ? dataListState.accept(dataList..remove(val))
              : dataListState.accept(dataList..add(val));
          return;
        }
        if (isCancelSelect) {
          final oldVal = dataListState.value;
          oldVal.contains(val) ? dataListState.accept([]) : dataListState.accept([val]);
        } else {
          dataListState.accept([val]);
        }
      },
    );
  }
}
