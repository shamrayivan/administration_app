import 'package:administration_app/di/di.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/res/urls.dart';

import 'package:dio/dio.dart';

class AuthRepository {
  final Dio _dio = getIt<DioManager>().dio;

  Future<void> auth() async {
    final response = await _dio.get<dynamic>(Urls.typesOfVehicle);
    logger(response.data);
  }

}
