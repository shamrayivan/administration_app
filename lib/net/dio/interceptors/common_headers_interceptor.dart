import 'dart:convert';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/storage/storage_manager.dart';
import 'package:dio/dio.dart';

class CommonHeadersInterceptor extends Interceptor {
  CommonHeadersInterceptor();

  final _storageManager = getIt<StorageManager>();

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? login = await _storageManager.getString(key: 'login');
    String? password = await _storageManager.getString(key: 'password');
    options.headers['Authorization'] = 'Basic ${base64Encode(utf8.encode('$login:$password'))}';
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';
    return handler.next(options);
  }
}
