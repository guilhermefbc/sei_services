// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MenuController on _MenuController, Store {
  late final _$isManualContextAtom =
      Atom(name: '_MenuController.isManualContext', context: context);

  @override
  bool get isManualContext {
    _$isManualContextAtom.reportRead();
    return super.isManualContext;
  }

  @override
  set isManualContext(bool value) {
    _$isManualContextAtom.reportWrite(value, super.isManualContext, () {
      super.isManualContext = value;
    });
  }

  late final _$isActiveAtom =
      Atom(name: '_MenuController.isActive', context: context);

  @override
  bool get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  late final _$_MenuControllerActionController =
      ActionController(name: '_MenuController', context: context);

  @override
  void changeBarState(int index) {
    final _$actionInfo = _$_MenuControllerActionController.startAction(
        name: '_MenuController.changeBarState');
    try {
      return super.changeBarState(index);
    } finally {
      _$_MenuControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleIsActive() {
    final _$actionInfo = _$_MenuControllerActionController.startAction(
        name: '_MenuController.toggleIsActive');
    try {
      return super.toggleIsActive();
    } finally {
      _$_MenuControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isManualContext: ${isManualContext},
isActive: ${isActive}
    ''';
  }
}
