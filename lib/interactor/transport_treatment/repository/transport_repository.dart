import 'dart:convert';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/analysis_logistic/analysis_logistic.dart';
import 'package:administration_app/model/efficeincy_transport/efficiency_transport.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/res/urls.dart';

import 'package:dio/dio.dart';

class TransportRepository {
  final Dio _dio = getIt<DioManager>().dio;

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

  Future<List<EfficiencyTransport>> getEfficiencyTransport({required List<Map<String, dynamic>> data, required DateTime dateBegin, required DateTime dateEnd}) async {
    final response = await _dio.post<dynamic>(Urls.efficencyTransport(dateBegin: dateBegin.millisecondsSinceEpoch, dateEnd: dateEnd.millisecondsSinceEpoch), data: data);
    logger(response.data);
    final a = jsonDecode(response.data);
    final List<EfficiencyTransport> listEfficiencyTransport = [];
    a.forEach((element) {
      listEfficiencyTransport.add(EfficiencyTransport.fromJson(element));
    });
    return listEfficiencyTransport;
  }

}
