import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String? email = "";

  @observable
  String? password = "";

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool _loggedIn = false;

  @action
  togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @action
  void setEmail(String? email) {
    this.email = email!;
  }

  @action
  void setPassword(String? password) {
    this.password = password!;
  }
}