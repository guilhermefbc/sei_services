// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionController on _TransactionController, Store {
  Computed<double>? _$filteredTransactionsTotalComputed;

  @override
  double get filteredTransactionsTotal =>
      (_$filteredTransactionsTotalComputed ??= Computed<double>(
              () => super.filteredTransactionsTotal,
              name: '_TransactionController.filteredTransactionsTotal'))
          .value;
  Computed<double>? _$filteredTransactionsTaxesTotalComputed;

  @override
  double get filteredTransactionsTaxesTotal =>
      (_$filteredTransactionsTaxesTotalComputed ??= Computed<double>(
              () => super.filteredTransactionsTaxesTotal,
              name: '_TransactionController.filteredTransactionsTaxesTotal'))
          .value;
  Computed<List<DateTime>>? _$transactionsDatesComputed;

  @override
  List<DateTime> get transactionsDates => (_$transactionsDatesComputed ??=
          Computed<List<DateTime>>(() => super.transactionsDates,
              name: '_TransactionController.transactionsDates'))
      .value;

  late final _$_TransactionControllerActionController =
      ActionController(name: '_TransactionController', context: context);

  @override
  void addTransactions(List<TransactionEntity> values) {
    final _$actionInfo = _$_TransactionControllerActionController.startAction(
        name: '_TransactionController.addTransactions');
    try {
      return super.addTransactions(values);
    } finally {
      _$_TransactionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFilteredTransactions(List<TransactionEntity> values) {
    final _$actionInfo = _$_TransactionControllerActionController.startAction(
        name: '_TransactionController.addFilteredTransactions');
    try {
      return super.addFilteredTransactions(values);
    } finally {
      _$_TransactionControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filteredTransactionsTotal: ${filteredTransactionsTotal},
filteredTransactionsTaxesTotal: ${filteredTransactionsTaxesTotal},
transactionsDates: ${transactionsDates}
    ''';
  }
}
