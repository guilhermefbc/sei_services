import 'dart:convert';
import 'package:sei_services/src/shared/data/datasources/remote/transactions_examples.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:sei_services/src/shared/data/models/product_model.dart';
import 'package:sei_services/src/shared/data/models/transaction_model.dart';
import 'package:sei_services/src/shared/domain/entities/auth_entity.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/domain/repositories/auth_repository.dart';

class TransactionService {
  final AuthRepository _auth;
  final Uuid _uuid;

  TransactionService(this._auth, this._uuid);

  Future<Map<String, dynamic>> getTransactions() async {
    Uri uri = Uri.parse("https://dev.api.sei-imposto.com/taxes/transactions/search");
    final response = await http.get(uri, headers: {
      'Content-Type': 'application/json',
      'X-HYPERMARKET': _auth.token
    });
    if (response.statusCode != 200) {
      throw ('Erro ao realizar requisição');
    }
    List resultMaps = jsonDecode(response.body);
    // List resultMaps = TransactionsExamples.getAll();
    // List resultMaps = TransactionsExamples.transactionsSmall;
    // List resultMaps = TransactionsExamples.transactionsBig;
    // List resultMaps = TransactionsExamples.transactionsWeb;

    List<TransactionModel> transactions = resultMaps
        .map((transaction) => TransactionModel.fromMap(transaction))
        .toList();
    List<ProductModel> products = _getAllTransactionsProducts(resultMaps);
    return <String, dynamic>{
      "transactions": transactions,
      "products": products
    };
  }

  List<ProductModel> _getAllTransactionsProducts(List resultMaps) {
    List<ProductModel> products = [];
    for (Map map in resultMaps) {
      List productListMap1 = map["Products"];
      List productListMap2 = productListMap1.first;
      List<ProductModel> productList = productListMap2.map((productMap) {
        Map tempMap = Map.of(productMap);
        tempMap["productId"] = _uuid.v4();
        tempMap["transactionId"] = map["_id"];
        return ProductModel.fromMap(tempMap);
      }).toList();
      products.addAll(productList);
    }
    return products;
  }
}



