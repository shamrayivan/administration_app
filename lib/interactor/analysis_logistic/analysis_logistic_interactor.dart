
import 'package:administration_app/interactor/analysis_logistic/repository/analysis_logistic_repository.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';

class AnalysisLogisticInteractor {
  final _repository = AnalysisLogisticRepository();

  Future<List<AnalysisLogistic>> getAnalysisLogistic({required int modeID, required List<Map<String, dynamic>> data}) =>
      _repository.getAnalysisLogistic(modeID: modeID, data: data);

  Future<List<EfficiencyTransport>> getEfficiencyTransport({required List<Map<String, dynamic>> data, required DateTime dateBegin, required DateTime dateEnd}) =>
      _repository.getEfficiencyTransport(data: data, dateBegin: dateBegin, dateEnd: dateEnd);

}
