
import 'package:administration_app/interactor/analysis_logistic/repository/analysis_logistic_repository.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';

class AnalysisLogisticInteractor {
  final _repository = AnalysisLogisticRepository();

  Future<List<TypeOfVehicle>> getTypeOfVehicle() =>
      _repository.getTypeOfVehicle();

  Future<List<Vehicles>> getVehicle() =>
      _repository.getVehicle();

  Future<List<AnalysisLogistic>> getAnalysisLogistic({required int modeID, required List<Map<String, dynamic>> data}) =>
      _repository.getAnalysisLogistic(modeID: modeID, data: data);

}
