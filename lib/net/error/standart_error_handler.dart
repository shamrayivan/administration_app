import 'dart:io';

import 'package:administration_app/di/di.dart';
import 'package:administration_app/ui/common/snack_bar.dart';
import 'package:administration_app/ui/router.dart';
import 'package:dio/dio.dart';
import 'package:mwwm/mwwm.dart';

class StandardErrorHandler implements ErrorHandler {


  final _appRouter = getIt<AppRouter>();
  @override
  bool handleError(Object e, dynamic s) {
    if (e is DioException) {
      final statusCode = e.response?.statusCode;
      if (statusCode != null) {
        showSnackBarError(error: e.response?.statusMessage ?? 'Ошибка');
        switch (statusCode) {
        case 401:
          // _authManager.userState.content(null);
          // _storageManager.deleteToken();
          showSnackBarError(error: 'Неправильные данные');
          return true;

          case 403:
            showSnackBarError(error: e.response?.data['message'].toString() as String);
            return true;
          case 404:
            showSnackBarError(
                error: 'Ошибка на стороне сервера (404)');
            return true;
        //   case 410:
        //     showSnackBarError(error: e.response?.data['message'] as String);
        //     return true;
        // case 426:
        //   if (_appRouter.stack
        //       .any((element) => element.name == RouteScreen.update_app)) {
        //     return true;
        //   }
        //   _appRouter.popUntilRoot();
        //   _appRouter.replaceNamed(RouteScreen.update_app);
        //   return true;
        }
      }
      if (
          e.error is SocketException) {
        showSnackBarError(error: e.error.toString());
        // _appRouter
        //   ..removeUntil((route) => false)
        //   ..replace(
        //     EmptyInternetErrorRoute(),
        //   );
        return true;
      }

      // if (e.error is CommonServerExceptions) {
      //   final error = e.error as CommonServerExceptions;
      //
      //   switch (error.code) {
      //     case 1005:
      //       return true;
      //     case 1002:
      //     case 1004:
      //     default:
      //       showSnackBar(text: e.error.toString());
      //   }
      // }

      //   switch (e.response?.statusCode) {
      //     case 800:
      //     case 801:
      //     case 802:
      //       print(e.response?.headers.value('message'));
      //       print(e.error);
      //       print(e.stackTrace);
      //       _authManager.logout();
      //       return;
      //     case 803:
      //       print(e.response?.headers.value('message'));
      //       print(e.error);
      //       print(e.stackTrace);
      //       _authManager.logout();
      //       return;
      //     case 900:
      //     case 901:
      //     case 902:
      //     case 903:
      //       final raw = e.response?.headers.value('message');
      //       if (raw != null) {
      //         final List<int> body = (jsonDecode(raw) as List).map((dynamic e) => e as int).toList();
      //         final decoded = utf8.decode(body);
      //         _scaffoldMessenger.currentState!.showSnackBar(snackBar(decoded));
      //         // todo убрать транслейт
      //         // print(e.response?.headers.value(decoded));
      //         print(decoded);
      //         print(e.response?.headers.value('message'));
      //         print(e.stackTrace);
      //         return;
      //       }
      //   }
      // }
      logger(s);
      throw e;
    }
    logger(s);
    throw e;
  }
}
