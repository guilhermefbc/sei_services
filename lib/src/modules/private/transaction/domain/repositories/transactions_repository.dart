import 'package:flutter/material.dart';
import 'package:sei_services/src/modules/private/transaction/data/datasources/local/transaction_db.dart';
import 'package:sei_services/src/modules/private/transaction/data/models/transaction_model.dart';
import 'package:sei_services/src/shared/domain/abstract/persistence_abstract.dart';
import 'package:sei_services/src/modules/private/transaction/domain/entities/transaction_entity.dart';

class TransactionsRepository {
  final TransactionDB _db;
  List<TransactionEntity> _transactions = [];

  TransactionsRepository(this._db);

  List<TransactionEntity> get transactions => _transactions;

  Future<void> save(List<TransactionModel> transactions) async {
    _transactions.addAll(transactions);
    _saveInLocalDB(transactions);
  }

  Future<void> _saveInLocalDB(List<TransactionModel> transactions) async {
    for (TransactionModel transaction in transactions) {
      _db.saveTransaction(transaction);
    }
  }

  Future<List<TransactionEntity>> getTransactions() async {
    await _getTransactionsByLocalDB();
    return _transactions;
  }

  Future<List<TransactionEntity>> getTransactionsByYearMonth(
      DateTime date) async {
    await _getTransactionsByLocalDB();
    final List<TransactionEntity> filtered = _transactions.where((transaction) {
      return DateUtils.isSameMonth(date, transaction.sellDate);
    }).toList();
    return filtered;
  }

  Future<void> _getTransactionsByLocalDB() async {
    if (_transactions.isEmpty) {
      _transactions.addAll(await _db.getAllTransactions());
    }
  }
}
