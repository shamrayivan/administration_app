import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/storage/storage_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:relation/relation.dart';

class SettingsScreenWm extends WidgetModelStandard {

  final onResetAccount = Action<void>();
  final _appRouter = getIt<AppRouter>();

  final _storageManager = getIt<StorageManager>();

  @override
  void onBind() {
    subscribe(onResetAccount.stream, (value) {
      _storageManager.allCleanData();
      _appRouter.pushAndPopUntil(SplashRoute(), predicate: (Route<dynamic> route) => false);
    });
  }
}