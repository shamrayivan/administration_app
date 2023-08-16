
import 'package:administration_app/interactor/gsm_treatment/repository/gsm_repository.dart';
import 'package:administration_app/model/gsm/gsm_drivers.dart';

class GSMInteractor {
  final _repository = GSMRepository();

  Future<GSMDrivers> getFuelGraph({required int mode, required String dateBegin, required String dateEnd, required String vehicle}) =>
      _repository.getFuelGraph(mode: mode, dateBegin: dateBegin, dateEnd: dateEnd, vehicle: vehicle);

}
