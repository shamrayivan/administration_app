import 'dart:async';
import 'package:administration_app/interactor/analysis_logistic/analysis_logistic_interactor.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:relation/relation.dart';

class AnalysisLogisticManager {
  final _interactor = AnalysisLogisticInteractor();

  final typeOfVehicle = EntityStreamedState<List<TypeOfVehicle>>();
  final vehicles = EntityStreamedState<List<Vehicles>>();
  final currentToggle = StreamedStateNS<int>(0);

  final typesOfVehicleStreamedState = StreamedState<List<TypeOfVehicle>>();

  final typesOfVehicleOrdersStreamedState = StreamedState<List<TypeOfVehicle>>();
  final vehiclesWaybillsStreamedState = StreamedState<List<Vehicles>>();
  final vehiclesTasksStreamedState = StreamedState<List<Vehicles>>();
  final vehiclesEfficiencyTransportStreamedState = StreamedState<List<Vehicles>>();

  final orderAnalisysLogistic = EntityStreamedState<List<AnalysisLogistic>>();
  final waybillAnalisysLogistic = EntityStreamedState<List<AnalysisLogistic>>();
  final taskAnalisysLogistic = EntityStreamedState<List<AnalysisLogistic>>();

  final efficiencyTransportState = EntityStreamedState<List<EfficiencyTransport>>();
  final dateBeginState = StreamedStateNS<DateTime>(DateTime(2021, 04, 01));
  final dateEndState = StreamedStateNS<DateTime>(DateTime(2021, 04, 30));


  Future<void> getTypeOfVehicle() async {
    typeOfVehicle.loading();
    final res = await _interactor.getTypeOfVehicle();
    typesOfVehicleOrdersStreamedState.accept(res);
    typeOfVehicle.content(res);
  }

  Future<void> getVehicle() async {
      vehicles.loading();
      final res = await _interactor.getVehicle();
      vehiclesWaybillsStreamedState.accept(res);
      vehiclesTasksStreamedState.accept(res);
      vehiclesEfficiencyTransportStreamedState.accept(res);
      vehicles.content(res);
  }

  Future<void> getAnalysisLogistic({required int modeID, required List<Map<String, dynamic>> data}) async {
    switch (modeID) {
      case 1: orderAnalisysLogistic.loading();
      case 2: waybillAnalisysLogistic.loading();
      case 3: taskAnalisysLogistic.loading();
    }
    final analisysLogisticLocal = await _interactor.getAnalysisLogistic(modeID: modeID, data: data);

    switch (modeID) {
      case 1: orderAnalisysLogistic.content(analisysLogisticLocal);
      case 2: waybillAnalisysLogistic.content(analisysLogisticLocal);
      case 3: taskAnalisysLogistic.content(analisysLogisticLocal);
    }
  }

  Future<void> getEfficiencyTransport({required List<Map<String, dynamic>> data, required DateTime dateBegin, required DateTime dateEnd}) async {
    efficiencyTransportState.loading();
    final efficiencyTransport = await _interactor.getEfficiencyTransport(data: data, dateBegin: dateBegin, dateEnd: dateEnd);
    efficiencyTransportState.content(efficiencyTransport);
  }


}
