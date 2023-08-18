import 'dart:async';
import 'package:administration_app/interactor/gsm_treatment/gsm_interactor.dart';
import 'package:administration_app/model/gsm/gsm_fuel_graph.dart';
import 'package:flutter/material.dart';
import 'package:relation/relation.dart';

class GSMManager {
  final _interactor = GSMInteractor();

  final selectedToggle = StreamedStateNS<List<bool>>([true, false, false]);
  final List<Widget> toggleWidgets = [
    Text(' По заказам '),
    Text(' По путевым листам '),
    Text(' По заданиям ')
  ];

  final currentToggle = StreamedStateNS<int>(0);

  final dateBeginState = StreamedStateNS<DateTime>(DateTime(2021, 04, 14));
  final dateEndState = StreamedStateNS<DateTime>(DateTime(2021, 04, 30));

  final fuelGraphState = EntityStreamedState<GSMFuelGraph>();

  Future<void> getFuelGraphVehicle({required int mode, required String dateBegin, required String dateEnd, required String vehicle}) async {
    fuelGraphState.loading();
    final res = await _interactor.getFuelGraphVehicle(mode: mode, dateBegin: dateBegin, dateEnd: dateEnd, vehicle: vehicle);
    fuelGraphState.content(res);
  }

  Future<void> getFuelGraphDriver({required String dateBegin, required String dateEnd, required String driver}) async {
    fuelGraphState.loading();
    final res = await _interactor.getFuelGraphDriver(dateBegin: dateBegin, dateEnd: dateEnd, driver: driver);
    fuelGraphState.content(res);
  }

}
