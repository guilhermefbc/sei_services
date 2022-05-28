import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {

  @observable
  String? firstName;

  @observable
  String? lastName;

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
  int activeStep = 0; // Initial step set to 5.

  @observable
  int upperBound = 3; // upperBound MUST BE total number of icons minus 1.


  @action
  togglePasswordVisibility() => passwordVisible = !passwordVisible;

  @computed
  String get changeAppBarTitle {
    const List<String> titles = [
      'Name',
      'Email',
      'Password',
      'Nickname',
      'Congratulations!'
    ];
    return titles[activeStep];
  }

  @action
  void setFirstName(String? value) {
    firstName = value!;
  }

  @action
  void setLastName(String? value) {
    lastName = value!;
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
}