import 'package:sei_services/src/shared/data/datasources/local/transaction_db.dart';
import 'package:sei_services/src/shared/data/models/transaction_model.dart';
import 'package:sei_services/src/shared/domain/abstract/persistence_abstract.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';

class TransactionsRepository {
  final TransactionDB _db;
  List<TransactionEntity> _transactions = [];

  TransactionsRepository(this._db);

  Future<void> save(List<TransactionModel> transactions) async {
    _transactions.addAll(transactions);
    _saveInLocalDB(transactions);
  }

  Future<void> _saveInLocalDB(List<TransactionModel> transactions) async {
    for(TransactionModel transaction in transactions) {
      _db.saveTransaction(transaction);
    }
  }

  Future<List<TransactionEntity>> getTransactions() async {
    _clean();
    await _getTransactionsByLocalDB();
    return _transactions;
  }

  Future<void> _getTransactionsByLocalDB() async {
    _transactions.addAll(await _db.getAllTransactions());
  }

  void _clean() {
    if(_transactions.isNotEmpty) {
      _transactions = [];
    }
  }
}