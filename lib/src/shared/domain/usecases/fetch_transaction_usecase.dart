import 'package:sei_services/src/core/connectivity/connection.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/modules/private/product/domain/repositories/products_repository.dart';
import 'package:sei_services/src/modules/private/transaction/domain/repositories/transactions_repository.dart';

class FetchTransactionsUsecase {
  final TransactionService _service;
  final TransactionsRepository _transactions;
  final ProductsRepository _products;
  final Connection _connection;
  final ProcessingRepository _processing;
  final TransactionController _controller;
  FetchTransactionsUsecase(this._service, this._transactions, this._products, this._connection, this._processing, this._controller);

  Future<void> fetchTransactions() async {
    final bool hasConnection = await _connection.hasConnection();
    if(hasConnection) {
      Map<String, dynamic> result = await _service.getTransactions();
      _controller.addTransactions(result["transactions"]);
      _transactions.save(result["transactions"]);
      _products.save(result["products"]);
      _processing.deleteProcessingList(result["transactions"]);
    }
  }
}