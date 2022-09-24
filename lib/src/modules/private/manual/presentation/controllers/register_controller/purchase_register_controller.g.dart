// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PurchaseRegisterController on _PurchaseRegisterController, Store {
  late final _$activeStepAtom =
      Atom(name: '_PurchaseRegisterController.activeStep', context: context);

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
      Atom(name: '_PurchaseRegisterController.upperBound', context: context);

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

  late final _$storeNameAtom =
      Atom(name: '_PurchaseRegisterController.storeName', context: context);

  @override
  String? get storeName {
    _$storeNameAtom.reportRead();
    return super.storeName;
  }

  @override
  set storeName(String? value) {
    _$storeNameAtom.reportWrite(value, super.storeName, () {
      super.storeName = value;
    });
  }

  late final _$amountAtom =
      Atom(name: '_PurchaseRegisterController.amount', context: context);

  @override
  num? get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(num? value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  late final _$dateAtom =
      Atom(name: '_PurchaseRegisterController.date', context: context);

  @override
  DateTime? get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime? value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PurchaseRegisterController.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_PurchaseRegisterControllerActionController =
      ActionController(name: '_PurchaseRegisterController', context: context);

  @override
  void setStoreName(String? value) {
    final _$actionInfo = _$_PurchaseRegisterControllerActionController
        .startAction(name: '_PurchaseRegisterController.setStoreName');
    try {
      return super.setStoreName(value);
    } finally {
      _$_PurchaseRegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAmount(String? value) {
    final _$actionInfo = _$_PurchaseRegisterControllerActionController
        .startAction(name: '_PurchaseRegisterController.setAmount');
    try {
      return super.setAmount(value);
    } finally {
      _$_PurchaseRegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime? value) {
    final _$actionInfo = _$_PurchaseRegisterControllerActionController
        .startAction(name: '_PurchaseRegisterController.setDate');
    try {
      return super.setDate(value);
    } finally {
      _$_PurchaseRegisterControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
activeStep: ${activeStep},
upperBound: ${upperBound},
storeName: ${storeName},
amount: ${amount},
date: ${date},
isLoading: ${isLoading}
    ''';
  }
}
