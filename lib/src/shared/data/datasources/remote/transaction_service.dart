import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sei_services/src/shared/data/models/transaction_model.dart';
import 'package:sei_services/src/shared/domain/entities/auth_entity.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/domain/repositories/auth_repository.dart';


const List<Map<String,dynamic>> transactions2 = [
  {
    "_id": "62c6ebc3fb587e9001aa1c7a",
    "expenseType": "Indefinido",
    "Products": [
      [
        {
          "description": "MALE DE DEXCLORFENIRAMINA0,4MG/ML SOL OR X 100 0,4mg/ml sol or x 100 ml+cp med",
          "discount": 0.99,
          "eanCode": "7899547503296",
          "ncmCode": "30049069",
          "quantity": 1.00,
          "metric": "UND",
          "price": 10.99,
          "productCode": "41345",
          "cfop": "5405",
          "approximateTaxation": 1.12,
          "productOrigin": "0 - Nacional, exceto as indicadas nos cï¿½digos 3 a 5",
          "amountOfBcOfIcmsStWithheld": 0,
          "icmsTaxation": 0,
          "isStockable": 0,
          "expenseType": "Saúde",
          "isMedicine": 1,
        }
      ]
    ],
    "Buyer": [
      {
        "nome": "Gui",
        "cpf": 00000000000,
        "address": "",
        "district": "",
        "zipCode": "",
        "city": "",
        "phone": "",
        "uf": "",
        "country": "",
        "stateRegistration": "",
      }
    ],
    "groupId": "25dfc3fd-b6eb-4ffe-9c20-945e53b1438e",
    "codigoNotaFiscal": "25220600833140000140650010000902021112086444",
    "accountNumber": 0,
    "customerId": 306,
    "TransactionType": "Debito",
    "transactionAmount": 10,
    "Store": "FARMACIA JATOBA",
    "sellDate": "2022-06-21T17:02:49.000Z",
    "totalTaxes": 0,
    "__v": 0,
  }
];


class TransactionService {
  final AuthRepository _auth;
  TransactionService(this._auth);

  Future<List<TransactionEntity>> getTransactions() async {
    Uri uri = Uri.parse("https://dev.api.sei-imposto.com/taxes/transactions/search");
    final response = await http.get(uri, headers: {'Content-Type': 'application/json', 'X-HYPERMARKET': _auth.token});
    if (response.statusCode != 200) {
      throw('Erro ao realizar requisição');
    }
    List transactions = jsonDecode(response.body);

    return transactions.map((transaction) => TransactionModel.fromMap(transaction)).toList();
  }
}