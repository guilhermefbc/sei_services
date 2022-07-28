import 'package:sei_services/src/shared/data/datasources/local/transaction_db.dart';
import 'package:sei_services/src/shared/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/data/models/transaction_model.dart';
import 'package:sei_services/src/shared/domain/abstract/persistence_abstract.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';

class TransactionsRepository implements Persistence{
  final TransactionDB _db;
  late List<TransactionEntity> _transactions;

  TransactionsRepository(this._db);

  @override
  Future<void> save(transactions) async {
    _transactions.addAll(transactions);
    await saveInLocalDB(transactions);
  }

  @override
  Future<void> saveInLocalDB(transactions) async {
    for(TransactionModel transaction in transactions) {
      await _db.saveTransaction(transaction);
    }
  }

  Future<List<TransactionEntity>> getTransactions() async {
    _initTransactionsList();
    await _getTransactionsByLocalDB();
    return _transactions;
  }

  Future<void> _getTransactionsByLocalDB() async {
    _transactions.addAll(await _db.getAllTransactions());
  }

  void _initTransactionsList() {
    if(_transactions.isNotEmpty) {
      _transactions = [];
    }
  }
}