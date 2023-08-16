
import 'package:administration_app/di/di.dart';
import 'package:administration_app/model/gsm/gsm_drivers.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/res/urls.dart';
import 'package:dio/dio.dart';

class GSMRepository {
  final Dio _dio = getIt<DioManager>().dio;

  Future<GSMDrivers> getFuelGraph({required int mode, required String dateBegin, required String dateEnd, required String vehicle}) async {
    final response = await _dio.post<dynamic>(Urls.gsmVehicles(mode: mode, dateBegin: dateBegin, dateEnd: dateEnd, vehicle: vehicle));
    logger(response.data);
    return GSMDrivers.fromJson(response.data['Водители'] as Map<String, dynamic>);
  }

}