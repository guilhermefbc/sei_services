import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sei_services/src/shared/data/models/transaction_model.dart';
import 'package:sei_services/src/shared/domain/entities/auth_entity.dart';

class TransactionService {
  final AuthEntity _auth;
  TransactionService(this._auth);

  Future<List<TransactionModel>> getTransactions() async {
    Uri uri = Uri.parse("https://dev.api.sei-imposto.com/taxes/transactions/search");
    final response = await http.get(uri, headers: {'Content-Type': 'application/json', 'X-HYPERMARKET': _auth.token});
    if (response.statusCode != 200) {
      throw('Erro ao realizar requisição');
    }
    List<Map<String,dynamic>> transactions = jsonDecode(response.body);
    return transactions.map((transaction) => TransactionModel.fromMap(transaction)).toList();
  }
}