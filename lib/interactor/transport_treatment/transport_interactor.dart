
import 'package:administration_app/interactor/transport_treatment/repository/transport_repository.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';

class TransportInteractor {
  final _repository = TransportRepository();

  Future<List<AnalysisLogistic>> getAnalysisLogistic({required int modeID, required List<Map<String, dynamic>> data}) =>
      _repository.getAnalysisLogistic(modeID: modeID, data: data);

  Future<List<EfficiencyTransport>> getEfficiencyTransport({required List<Map<String, dynamic>> data, required DateTime dateBegin, required DateTime dateEnd}) =>
      _repository.getEfficiencyTransport(data: data, dateBegin: dateBegin, dateEnd: dateEnd);

}
