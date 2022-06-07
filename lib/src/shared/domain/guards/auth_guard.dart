import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/shared/domain/usecases/is_logged_usecase.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    return Modular.get<IsLoggedUsecase>().isLogged();
  }
}