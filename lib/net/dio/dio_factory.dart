import 'package:administration_app/di/di.dart';
import 'package:administration_app/net/dio/interceptors/common_headers_interceptor.dart';
import 'package:dio/dio.dart';

class DioFactory {
  final _timeout = const Duration(seconds: 60);

  Future<Dio> create({required String baseUrl, required Dio dio}) async {
    final options = _createOptions(baseUrl: baseUrl);
    dio.options = options;
    final interceptors = await _createInterceptors();
    interceptors.forEach(dio.interceptors.add);
    return dio;
  }

  Future<List<Interceptor>> _createInterceptors() async {
    final interceptors = <Interceptor>[
      CommonHeadersInterceptor(),
      InterceptorsWrapper(
        onRequest: (option, handler) {
          logger('url: ${option.uri} \ndata: ${option.data}\n');
          return handler.next(option);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          handler.next(response);
        },
        onError: (error, handler) {
          logger('error!!! \n\nurl: ${error.response?.realUri}\n\ndata: ${error.response?.data}');
          return handler.next(error);
        },
      )
    ];
    return interceptors;
  }

  BaseOptions _createOptions({required String baseUrl}) {
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: _timeout,
      receiveTimeout: _timeout,
      sendTimeout: _timeout,
    );
  }
}
