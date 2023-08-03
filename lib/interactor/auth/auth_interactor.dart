
import 'package:administration_app/interactor/auth/repository/auth_repository.dart';

class AuthInteractor {
  final _repository = AuthRepository();

  Future<void> auth() =>
      _repository.auth();


}
