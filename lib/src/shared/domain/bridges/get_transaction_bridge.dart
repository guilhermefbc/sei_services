import 'package:sei_services/src/shared/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/data/models/transaction_model.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/domain/repositories/products_repository.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';

class GetTransactionBridge {
  final TransactionService _service;
  final TransactionsRepository _transactions;
  final ProductsRepository _products;
  GetTransactionBridge(this._service, this._transactions, this._products);

  Future<void> getTransactions() async {
    List<TransactionEntity> transactions = await _service.getTransactions();
    for (TransactionEntity transaction in transactions) {

    }
  }
}