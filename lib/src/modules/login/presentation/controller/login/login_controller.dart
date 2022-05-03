import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String? email = "";

  @observable
  String? password = "";

  @action
  void setEmail(String? email) {
    email = email!;
  }

  @action
  void setPassword(String? password) {
    password = password!;
  }
}