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

class AuthScreenWm extends WidgetModelStandard {

  final loginController = TextEditingController();
  final passController = TextEditingController();
  final baseNameController = TextEditingController();
  final urlController = TextEditingController();
  final _authManager = getIt<AuthManager>();
  final _storageManager = getIt<StorageManager>();
  final _dioManager = getIt<DioManager>();
  final _appRouter = getIt<AppRouter>();

  final onEnter = Action<void>();
  final showObscure = Action<void>();
  final onHttps = Action<void>();

  final obscureState = StreamedStateNS<bool>(true);
  final httpsState = StreamedStateNS<bool>(false);


  @override
  void onBind() {
    subscribe(onHttps.stream, (_) {
      httpsState.accept(!httpsState.value);
    });
    subscribe(showObscure.stream, (_) {
      obscureState.accept(!obscureState.value);
    });
    subscribe(onEnter.stream, (_) async {
      if (loginController.text.isEmpty || passController.text.isEmpty ||
          baseNameController.text.isEmpty || urlController.text.isEmpty){
        showSnackBarError(error: 'Введите все данные');
        return;
      }
      await _storageManager.saveString(key: 'login', text: loginController.text);
      await _storageManager.saveString(key: 'password', text: passController.text);
      await _storageManager.saveString(key: 'baseUrl', text: urlController.text);
      String? saveLogin = await _storageManager.getString(key: 'login');
      String? savePassword = await _storageManager.getString(key: 'password');
      String? baseUrl = await _storageManager.getString(key: 'baseUrl');
      print('${saveLogin}' + ' ' + '${savePassword}' + ' ' + '${baseUrl}');
      _dioManager.updateBaseUrl = '${httpsState.value ? 'https' : 'http'}://' + urlController.text + '/' +baseNameController.text +subDomen;
      doFutureHandleError(_authManager.auth(), onError: (e,s) async {
        await _storageManager.allCleanData();
        String? saveLogin = await _storageManager.getString(key: 'login');
        String? savePassword = await _storageManager.getString(key: 'password');
        String? baseUrl = await _storageManager.getString(key: 'baseUrl');
        print('${saveLogin}' + ' ' + '${savePassword}' + ' ' +'${baseUrl}');
        _appRouter.replaceNamed(RouteScreen.chooseTreatment);
      });
    });
  }

}