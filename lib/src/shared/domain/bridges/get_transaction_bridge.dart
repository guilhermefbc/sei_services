import 'package:sei_services/src/core/connectivity/connection.dart';
import 'package:sei_services/src/shared/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/domain/repositories/products_repository.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';

class GetTransactionBridge {
  final TransactionService _service;
  final TransactionsRepository _transactions;
  final ProductsRepository _products;
  final Connection _connection;
  GetTransactionBridge(this._service, this._transactions, this._products, this._connection);

  Future<void> fetchTransactions() async {
    final bool hasConnection = await _connection.hasConnection();
    if(hasConnection) {
      Map<String, dynamic> result = await _service.getTransactions();
      _transactions.save(result["transactions"]);
      _products.save(result["products"]);
    }
  }
}