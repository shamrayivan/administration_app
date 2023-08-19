
import 'dart:convert';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/gsm/gsm_drivers.dart';
import 'package:administration_app/model/gsm/gsm_fuel_graph.dart';
import 'package:administration_app/model/gsm/gsm_graph_consumption.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/res/urls.dart';
import 'package:dio/dio.dart';

class GSMRepository {
  final Dio _dio = getIt<DioManager>().dio;

  Future<GSMFuelGraph> getFuelGraphVehicle({Map<String, dynamic>? data, required int mode, required String dateBegin, required String dateEnd, required String vehicle}) async {
    final response = await _dio.post<dynamic>(Urls.gsmVehicles(mode: mode, dateBegin: dateBegin, dateEnd: dateEnd, vehicle: vehicle), data: data);
    logger(response.data);
    return GSMFuelGraph.fromJson(jsonDecode(response.data));
  }

  Future<GSMFuelGraph> getFuelGraphDriver({Map<String, dynamic>? data, required String dateBegin, required String dateEnd, required String driver}) async {
    final response = await _dio.post<dynamic>(Urls.gsmDriver(dateBegin: dateBegin, dateEnd: dateEnd, driver: driver), data: data);
    logger(response.data);
    return GSMFuelGraph.fromJson(jsonDecode(response.data));
  }


  Future<void> getFuelTableData({required List<Map<String, dynamic>> data, String? dateBegin, String? dateEnd, required String period, required int mode, required bool hideRetired, String? year}) async {
    print(period);
    final response = await _dio.post<dynamic>(Urls.gsmFuelTable(period: period, mode: mode, hideRetired: hideRetired, dateEnd: dateEnd, dateBegin: dateBegin, year: year), data: data);
    logger(response.data);
    // return GSMFuelGraph.fromJson(jsonDecode(response.data));
  }

}