import 'package:administration_app/net/dio/dio_factory.dart';
import 'package:administration_app/ui/res/urls.dart';
import 'package:dio/dio.dart';

class DioManager {
  DioManager();

  final dio = Dio();

  Future<void> init() async {
    final dioFactory = DioFactory();
    await dioFactory.create(baseUrl: mainUrl, dio: dio);
  }

  set updateBaseUrl(String baseUrl) => dio.options.baseUrl = baseUrl;

  Future<void> updateBaseUrlFunc({required String url}) async {
    updateBaseUrl = url;
  }

  void resetBaseUrl() => dio.options.baseUrl = mainUrl;
}
