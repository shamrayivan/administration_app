import 'dart:async';
import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/main/main_interactor.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:flutter/material.dart';
import 'package:relation/relation.dart';

class MainManager {
  final _interactor = MainInteractor();

  final _interactorAnalysisManager = getIt<TransportManager>();


  final typeOfVehicle = EntityStreamedState<List<TypeOfVehicle>>();
  final vehicles = EntityStreamedState<List<Vehicles>>();


  Future<void> getTypeOfVehicle() async {
    typeOfVehicle.loading();
    final res = await _interactor.getTypeOfVehicle();
    _interactorAnalysisManager.typesOfVehicleOrdersStreamedState.accept(res);
    typeOfVehicle.content(res);
  }

  Future<void> getVehicle() async {
    vehicles.loading();
    final res = await _interactor.getVehicle();
    _interactorAnalysisManager.vehiclesWaybillsStreamedState.accept(res);
    _interactorAnalysisManager.vehiclesTasksStreamedState.accept(res);
    _interactorAnalysisManager.vehiclesEfficiencyTransportStreamedState.accept(res);
    vehicles.content(res);
  }

  Future<void> getDrivers() async {
    final res = await _interactor.getDrivers();
  }



}
