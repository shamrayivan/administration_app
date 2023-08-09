import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/auth/auth_manager.dart';
import 'package:administration_app/interactor/storage/storage_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/common/snack_bar.dart';
import 'package:administration_app/ui/res/urls.dart';
import 'package:administration_app/ui/router.dart';
import 'package:flutter/cupertino.dart' hide Action;
import 'package:relation/relation.dart';

class ChooseTreatmentScreenWm extends WidgetModelStandard {

  final onTransport = Action<void>();
  final onGSM = Action<void>();
  final _appRouter = getIt<AppRouter>();

  @override
  void onBind() {
    subscribe(onTransport.stream, (value) {
      _appRouter.pushNamed(RouteScreen.transport);
    });
    subscribe(onGSM.stream, (value) {
      _appRouter.pushNamed(RouteScreen.gsm);
    });
  }
}