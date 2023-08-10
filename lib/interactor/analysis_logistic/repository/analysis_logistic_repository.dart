import 'dart:convert';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/type_of_vehicle/type_of_vehicle.dart';
import 'package:administration_app/model/vehicles/vehicles.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/res/urls.dart';

import 'package:dio/dio.dart';

class AnalysisLogisticRepository {
  final Dio _dio = getIt<DioManager>().dio;

  Future<List<TypeOfVehicle>> getTypeOfVehicle() async {
    final response = await _dio.get<dynamic>(Urls.typesOfVehicle);
    logger(jsonDecode(response.data ));
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

  Future<List<AnalysisLogistic>> getAnalysisLogistic({required int modeID, required List<Map<String, dynamic>> data}) async {
    final response = await _dio.post<dynamic>(Urls.analysisLogisticWhithID(modeID: modeID), data: data);
    logger(jsonDecode(response.data ));
    final a = jsonDecode(response.data);
    final List<AnalysisLogistic> listAnalysisLogistic = [];
    a.forEach((element) {
      listAnalysisLogistic.add(AnalysisLogistic.fromJson(element));
    });
    return listAnalysisLogistic;
  }

}
