import 'dart:async';
import 'package:administration_app/interactor/auth/auth_interactor.dart';

class AuthManager {
  final _interactor = AuthInteractor();


  Future<void> auth() async {
    await _interactor.auth();
  }


}
