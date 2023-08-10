import 'dart:async';
import 'package:administration_app/interactor/analysis_logistic/analysis_logistic_interactor.dart';
import 'package:administration_app/interactor/auth/auth_interactor.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:relation/relation.dart';

class AnalysisLogisticManager {
  final _interactor = AnalysisLogisticInteractor();

  final typeOfVehicle = EntityStreamedState<List<TypeOfVehicle>>();
  final analisysLogistic = EntityStreamedState<List<AnalysisLogistic>>();
  final vehicles = EntityStreamedState<List<Vehicles>>();
  final currentToggle = StreamedStateNS<int>(0);


  Future<void> getTypeOfVehicle() async {
    typeOfVehicle.loading();
    final res = await _interactor.getTypeOfVehicle();
    typeOfVehicle.content(res);
  }

  Future<void> getVehicle() async {
    vehicles.loading();
    final res = await _interactor.getVehicle();
    vehicles.content(res);
  }

  Future<void> getAnalysisLogistic({required int modeID, required List<Map<String, dynamic>> data}) async {
    analisysLogistic.loading();
    final analisysLogisticLocal = await _interactor.getAnalysisLogistic(modeID: modeID, data: data);
    analisysLogistic.content(analisysLogisticLocal);
  }


}
