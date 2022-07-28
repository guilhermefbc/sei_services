import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/util/from_api_util/from_api_type_util.dart';

class TransactionModel extends TransactionEntity {

  TransactionModel({
    required transactionId,
    required expenseGroupId,
    required accountNumber,
    required transactionType,
    required transactionAmount,
    required expenseType,
    required storeName,
    required sellDate,
    required totalTaxes,
    required codigoNotaFiscal,
    required cpf,
  }) : super(
    transactionId: transactionId,
    expenseGroupId: expenseGroupId,
    accountNumber: accountNumber,
    transactionType: transactionType,
    transactionAmount: transactionAmount,
    expenseType: expenseType,
    storeName: storeName,
    sellDate: sellDate,
    totalTaxes: totalTaxes,
    codigoNotaFiscal: codigoNotaFiscal,
    cpf: cpf,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionId': transactionId,
      'accountNumber': accountNumber,
      'transactionType': transactionType,
      'transactionAmount': transactionAmount,
      'expenseType': expenseType,
      'sellDate': FromApiTypeUtil.toMyString(sellDate),
      'storeName': storeName,
      'totalTaxes': totalTaxes,
      'expenseGroupId': expenseGroupId,
      'cpf': cpf
    };
  }

  factory TransactionModel.fromMap(Map map) {
    return TransactionModel(
        transactionId: FromApiTypeUtil.toMyString(map["_id"] ?? map["transactionId"]),
        expenseGroupId: FromApiTypeUtil.toMyString(map["groupId"] ?? map["expenseGroupId"]),
        accountNumber: FromApiTypeUtil.toInt(map["accountNumber"]),
        transactionType: map["TransactionType"],
        transactionAmount: FromApiTypeUtil.toDouble(map['transactionAmount']),
        expenseType: FromApiTypeUtil.toMyString(map['expenseType']),
        storeName: FromApiTypeUtil.toMyString(map['Store'] ?? map['storeName']),
        sellDate: FromApiTypeUtil.toDateTime(map['sellDate']),
        totalTaxes: FromApiTypeUtil.toDouble(map['totalTaxes']),
        codigoNotaFiscal: FromApiTypeUtil.toMyString(map["codigoNotaFiscal"]),
        cpf: FromApiTypeUtil.toMyString(map["cpf"]),
    );
  }
}