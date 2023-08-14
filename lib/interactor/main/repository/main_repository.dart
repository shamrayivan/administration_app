import 'dart:convert';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/drivers/drivers.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/res/urls.dart';

import 'package:dio/dio.dart';

class MainRepository {
  final Dio _dio = getIt<DioManager>().dio;

  Future<List<TypeOfVehicle>> getTypeOfVehicle() async {
    final response = await _dio.get<dynamic>(Urls.typesOfVehicle);
    logger(jsonDecode(response.data));
    final a = jsonDecode(response.data);
    final List<TypeOfVehicle> listTypeOfVehicle = [];
    a.forEach((element) {
      listTypeOfVehicle.add(TypeOfVehicle.fromJson(element));
    });
    return listTypeOfVehicle;
  }

  Future<List<Vehicles>> getVehicle() async {
    final response = await _dio.get<dynamic>(Urls.vehicles);
    logger(jsonDecode(response.data));
    final a = jsonDecode(response.data);
    final List<Vehicles> listVehicles = [];
    a.forEach((element) {
      listVehicles.add(Vehicles.fromJson(element));
    });
    return listVehicles;
  }

  Future<List<Drivers>> getDrivers() async {
    final response = await _dio.get<dynamic>(Urls.drivers);
    logger(jsonDecode(response.data));
    final a = jsonDecode(response.data);
    final List<Drivers> listDrivers = [];
    a.forEach((element) {
      listDrivers.add(Drivers.fromJson(element));
    });
    return listDrivers;
  }
}
