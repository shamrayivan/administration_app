
import 'package:administration_app/di/di.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:dio/dio.dart';

class GSMRepository {
  final Dio _dio = getIt<DioManager>().dio;


}