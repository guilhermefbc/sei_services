// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanner_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ScannerController on _ScannerController, Store {
  late final _$codeAtom =
      Atom(name: '_ScannerController.code', context: context);

  @override
  String? get code {
    _$codeAtom.reportRead();
    return super.code;
  }

  @override
  set code(String? value) {
    _$codeAtom.reportWrite(value, super.code, () {
      super.code = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_ScannerController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$_ScannerControllerActionController =
      ActionController(name: '_ScannerController', context: context);

  @override
  void setCode(String? value) {
    final _$actionInfo = _$_ScannerControllerActionController.startAction(
        name: '_ScannerController.setCode');
    try {
      return super.setCode(value);
    } finally {
      _$_ScannerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
code: ${code},
loading: ${loading}
    ''';
  }
}
