import 'package:administration_app/interactor/auth/auth_manager.dart';
import 'package:administration_app/interactor/gsm_treatment/gsm_manager.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/interactor/storage/storage_manager.dart';
import 'package:administration_app/interactor/transport_treatment/transport_manager.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/net/error/standart_error_handler.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_printer/flutter_printer.dart';
import 'package:get_it/get_it.dart';
import 'package:mwwm/mwwm.dart';

GetIt getIt = GetIt.instance;
Function logger = Printer.printMapJsonLog;

class DI {
  DI() {
    _init();
    _manager();
  }

  void _init() {
    getIt
      ..registerSingleton<AppRouter>(AppRouter())
      ..registerSingleton<GlobalKey<ScaffoldState>>(GlobalKey<ScaffoldState>())
      ..registerSingleton<GlobalKey<ScaffoldMessengerState>>(GlobalKey<ScaffoldMessengerState>())
      ..registerSingleton<WidgetModelDependencies>(
        WidgetModelDependencies(errorHandler: StandardErrorHandler())
      );
  }

  void _manager() {
    getIt
      ..registerSingleton<DioManager>(DioManager())
      ..registerSingleton<TransportManager>(TransportManager())
      ..registerSingleton<MainManager>(MainManager())
      ..registerSingleton<GSMManager>(GSMManager())
      ..registerSingleton<StorageManager>(StorageManager())
      ..registerSingleton<AuthManager>(AuthManager());
  }
}
