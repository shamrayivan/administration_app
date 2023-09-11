import 'dart:async';
import 'package:administration_app/interactor/gsm_treatment/gsm_interactor.dart';
import 'package:administration_app/model/gsm/gsm_fuel_graph.dart';
import 'package:flutter/material.dart';
import 'package:relation/relation.dart';

class GSMManager {
  final _interactor = GSMInteractor();

  final selectedToggle = StreamedStateNS<List<bool>>([true, false, false]);
  final List<Widget> toggleWidgets = [
    const Text(' По заказам '),
    const Text(' По путевым листам '),
    const Text(' По заданиям ')
  ];

  final hideRetiredState = StreamedStateNS<bool>(false);

  final currentToggle = StreamedStateNS<int>(0);

  final dateBeginState = StreamedStateNS<DateTime>(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 7));
  final dateEndState = StreamedStateNS<DateTime>(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));

  final fuelGraphState = EntityStreamedState<GSMFuelGraph>();
  final fuelTableState = EntityStreamedState<List<Map<String, dynamic>>>();

  Future<void> getFuelGraphVehicle({Map<String, dynamic>? data, required int mode, required String dateBegin, required String dateEnd, required String vehicle}) async {
    fuelGraphState.loading();
    final res = await _interactor.getFuelGraphVehicle(data: data, mode: mode, dateBegin: dateBegin, dateEnd: dateEnd, vehicle: vehicle);
    fuelGraphState.content(res);
  }

  Future<void> getFuelGraphDriver({Map<String, dynamic>? data, required String dateBegin, required String dateEnd, required String driver}) async {
    fuelGraphState.loading();
    final res = await _interactor.getFuelGraphDriver(data: data, dateBegin: dateBegin, dateEnd: dateEnd, driver: driver);
    fuelGraphState.content(res);
  }

  Future<void> getFuelTableData({required List<Map<String, dynamic>> data,
    String? dateBegin,
    String? dateEnd,
    required String period,
    required int mode,
    required bool hideRetired,
    String? year}) async {
    fuelTableState.loading();
    final res = await _interactor.getFuelTableData(
        data: data,
        period: period,
        mode: mode,
        hideRetired: hideRetired,
        dateBegin: dateBegin,
        dateEnd: dateEnd,
        year: year);
    fuelTableState.content(res);
  }
}
