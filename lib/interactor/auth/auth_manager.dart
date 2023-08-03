import 'dart:async';
import 'package:administration_app/interactor/auth/auth_interactor.dart';

class AuthManager {
  final _interactor = AuthInteractor();


  Future<void> auth() async {
    final res = await _interactor.auth();
  }


}
