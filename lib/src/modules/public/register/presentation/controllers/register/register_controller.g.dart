// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
  Computed<String>? _$changeAppBarTitleComputed;

  @override
  String get changeAppBarTitle => (_$changeAppBarTitleComputed ??=
          Computed<String>(() => super.changeAppBarTitle,
              name: '_RegisterController.changeAppBarTitle'))
      .value;

  late final _$firstNameAtom =
      Atom(name: '_RegisterController.firstName', context: context);

  @override
  String? get firstName {
    _$firstNameAtom.reportRead();
    return super.firstName;
  }

  @override
  set firstName(String? value) {
    _$firstNameAtom.reportWrite(value, super.firstName, () {
      super.firstName = value;
    });
  }

  late final _$lastNameAtom =
      Atom(name: '_RegisterController.lastName', context: context);

  @override
  String? get lastName {
    _$lastNameAtom.reportRead();
    return super.lastName;
  }

  @override
  set lastName(String? value) {
    _$lastNameAtom.reportWrite(value, super.lastName, () {
      super.lastName = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_RegisterController.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_RegisterController.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_RegisterController.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$passwordVisibleAtom =
      Atom(name: '_RegisterController.passwordVisible', context: context);

  @override
  bool get passwordVisible {
    _$passwordVisibleAtom.reportRead();
    return super.passwordVisible;
  }

  @override
  set passwordVisible(bool value) {
    _$passwordVisibleAtom.reportWrite(value, super.passwordVisible, () {
      super.passwordVisible = value;
    });
  }

  late final _$nicknameAtom =
      Atom(name: '_RegisterController.nickname', context: context);

  @override
  String? get nickname {
    _$nicknameAtom.reportRead();
    return super.nickname;
  }

  @override
  set nickname(String? value) {
    _$nicknameAtom.reportWrite(value, super.nickname, () {
      super.nickname = value;
    });
  }

  late final _$activeStepAtom =
      Atom(name: '_RegisterController.activeStep', context: context);

  @override
  int get activeStep {
    _$activeStepAtom.reportRead();
    return super.activeStep;
  }

  @override
  set activeStep(int value) {
    _$activeStepAtom.reportWrite(value, super.activeStep, () {
      super.activeStep = value;
    });
  }

  late final _$upperBoundAtom =
      Atom(name: '_RegisterController.upperBound', context: context);

  @override
  int get upperBound {
    _$upperBoundAtom.reportRead();
    return super.upperBound;
  }

  @override
  set upperBound(int value) {
    _$upperBoundAtom.reportWrite(value, super.upperBound, () {
      super.upperBound = value;
    });
  }

  late final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController', context: context);

  @override
  dynamic togglePasswordVisibility() {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstName(String? value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setFirstName');
    try {
      return super.setFirstName(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastName(String? value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setLastName');
    try {
      return super.setLastName(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String? value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String? value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String? value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction(
        name: '_RegisterController.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstName: ${firstName},
lastName: ${lastName},
email: ${email},
password: ${password},
confirmPassword: ${confirmPassword},
passwordVisible: ${passwordVisible},
nickname: ${nickname},
activeStep: ${activeStep},
upperBound: ${upperBound},
changeAppBarTitle: ${changeAppBarTitle}
    ''';
  }
}
