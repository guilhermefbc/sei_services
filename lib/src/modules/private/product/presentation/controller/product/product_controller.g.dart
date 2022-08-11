// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on _ProductController, Store {
  late final _$_ProductControllerActionController =
      ActionController(name: '_ProductController', context: context);

  @override
  void addAllProducts(List<ProductEntity> values) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.addAllProducts');
    try {
      return super.addAllProducts(values);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(ProductEntity value) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.removeProduct');
    try {
      return super.removeProduct(value);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
