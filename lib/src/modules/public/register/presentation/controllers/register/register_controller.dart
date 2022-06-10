import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {

  @observable
  String? firstname;

  @observable
  String? lastname;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  bool passwordVisible = false;

  @observable
  String? nickname;


  // THE FOLLOWING TWO VARIABLES ARE REQUIRED TO CONTROL THE STEPPER.
  @observable
  int activeStep = 0; // Initial step set to 0.

  @observable
  int upperBound = 3; // upperBound MUST BE total number of icons minus 1.

  @observable
  bool isLoading = false;

  @action
  toggleIsLoading() => isLoading = !isLoading;

  @action
  togglePasswordVisibility() => passwordVisible = !passwordVisible;


  @action
  void setFirstName(String? value) {
    firstname = value!;
  }

  @action
  void setLastName(String? value) {
    lastname = value!;
  }

  @action
  void setEmail(String? value) {
    email = value!;
  }

  @action
  void setPassword(String? value) {
    password = value!;
  }

  @action
  void setConfirmPassword(String? value) {
    confirmPassword = value!;
  }

  @action
  void setNickname(String? value) {
    nickname = value!;
  }


}