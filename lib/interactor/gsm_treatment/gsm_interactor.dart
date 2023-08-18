
import 'package:administration_app/interactor/gsm_treatment/repository/gsm_repository.dart';
import 'package:administration_app/model/gsm/gsm_drivers.dart';
import 'package:administration_app/model/gsm/gsm_fuel_graph.dart';

class GSMInteractor {
  final _repository = GSMRepository();

  Future<GSMFuelGraph> getFuelGraphVehicle({required int mode, required String dateBegin, required String dateEnd, required String vehicle}) =>
      _repository.getFuelGraphVehicle(mode: mode, dateBegin: dateBegin, dateEnd: dateEnd, vehicle: vehicle);

  Future<GSMFuelGraph> getFuelGraphDriver({required String dateBegin, required String dateEnd, required String driver}) =>
      _repository.getFuelGraphDriver(dateBegin: dateBegin, dateEnd: dateEnd, driver: driver);

}
