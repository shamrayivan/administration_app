
import 'dart:convert';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/gsm/gsm_fuel_graph.dart';
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


  Future<List<Map<String, dynamic>>> getFuelTableData({required List<Map<String, dynamic>> data, String? dateBegin, String? dateEnd, required String period, required int mode, required bool hideRetired, String? year}) async {
    final response = await _dio.post<dynamic>(Urls.gsmFuelTable(period: period, mode: mode, hideRetired: hideRetired, dateEnd: dateEnd, dateBegin: dateBegin, year: year), data: data);
    logger(response.data);
    List listDataTable = jsonDecode(response.data);
    final List<Map<String, dynamic>> map = [];
    List<String> getAllKeys = listDataTable[0].keys.toList();
    // List getAllValues = listDataTable[0].values.toList();
    for (int i = 0; i < getAllKeys.length; i++) {
      if(getAllKeys[i].contains("нн")){
        getAllKeys[i] = "Неделя${getAllKeys[i].substring(getAllKeys[i].length-2,getAllKeys[i].length)} - ${getAllKeys[i].substring(1,5)}";
      } else if (getAllKeys[i].contains("мм")){
        getAllKeys[i] = " Месяц${getAllKeys[i].substring(getAllKeys[i].length-2,getAllKeys[i].length)} - ${getAllKeys[i].substring(1,5)}";
      }
    }
    listDataTable.forEach((element) {
      List a = element.values.toList();
      Map<String, dynamic> b = {};
      for(int i = 0; i< getAllKeys.length; i++){
        b[getAllKeys[i]] = a[i];
        // map.add({
        //   getAllKeys[i] : a[i]
        // });
      }
      map.add(b);
    });
    logger(map);
    return map;
  }

}