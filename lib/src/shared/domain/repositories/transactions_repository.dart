import 'package:sei_services/src/shared/data/datasources/local/transaction_db.dart';
import 'package:sei_services/src/shared/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/domain/abstract/persistence_abstract.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';

class TransactionsRepository implements Persistence{
  final TransactionDB _db;
  List<TransactionEntity> _transactions = [];

  TransactionsRepository(this._db);

  @override
  Future<void> save(transactions) async {
    _transactions.addAll(transactions);
    await saveInLocalDB(transactions);
  }

  @override
  Future<void> saveInLocalDB(transactions) async {

  }

  Future<List<TransactionEntity>> getTransactions() async {
    return _transactions;
  }
}