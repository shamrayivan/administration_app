import 'dart:async';

import 'package:administration_app/app_config/runner.dart';
import 'package:administration_app/di/di.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:flutter/material.dart';

void main() async{
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    DI();
    await _initDio();
    await run();
  }, (error, stack) {
    logger(error);
    logger(stack);
  });
}

Future<void> _initDio() async {
  final dioManager = getIt<DioManager>();
  await dioManager.init();
}

