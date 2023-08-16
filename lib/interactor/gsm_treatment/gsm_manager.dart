import 'dart:async';
import 'package:administration_app/interactor/gsm_treatment/gsm_interactor.dart';
import 'package:administration_app/interactor/transport_treatment/transport_interactor.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
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

  Future<void> getFuelGraph({required int mode, required String dateBegin, required String dateEnd, required String vehicle}) async {
    final res = await _interactor.getFuelGraph(mode: mode, dateBegin: dateBegin, dateEnd: dateEnd, vehicle: vehicle);
  }

}
