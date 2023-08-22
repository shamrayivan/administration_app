import 'package:administration_app/di/di.dart';
import 'package:administration_app/interactor/main/main_manager.dart';
import 'package:administration_app/interactor/storage/storage_manager.dart';
import 'package:administration_app/model/common/widget_model_standart.dart';
import 'package:administration_app/net/dio/dio_manager.dart';
import 'package:administration_app/ui/common/snack_bar.dart';
import 'package:administration_app/ui/router.dart';
import 'package:relation/relation.dart';

class EmptyInternetErrorScreenWm extends WidgetModelStandard {

  final _appRouter = getIt<AppRouter>();

  final onRestart = Action<void>();

  @override
  void onBind() {
    subscribe(onRestart.stream, (value) async {
      _appRouter.replaceNamed(RouteScreen.root);
    });
  }
}