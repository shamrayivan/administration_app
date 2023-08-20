
import 'package:administration_app/interactor/main/repository/main_repository.dart';
import 'package:administration_app/model/drivers/drivers.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';

class MainInteractor {
  final _repository = MainRepository();

  Future<List<TypeOfVehicle>> getTypeOfVehicle() =>
      _repository.getTypeOfVehicle();

  Future<List<Vehicles>> getVehicle() =>
      _repository.getVehicle();

  Future<List<Drivers>> getDrivers() =>
      _repository.getDrivers();
}
