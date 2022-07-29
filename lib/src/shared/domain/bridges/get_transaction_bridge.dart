import 'package:sei_services/src/shared/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/domain/repositories/products_repository.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';

class GetTransactionBridge {
  final TransactionService _service;
  final TransactionsRepository _transactions;
  final ProductsRepository _products;
  GetTransactionBridge(this._service, this._transactions, this._products);

  Future<void> fetchTransactions() async {
    Map<String, dynamic> result = await _service.getTransactions();
    _transactions.save(result["transactions"]);
    _products.save(result["products"]);
  }
}