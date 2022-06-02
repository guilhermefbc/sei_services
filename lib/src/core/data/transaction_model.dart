import 'package:sei_services/src/core/data/user_model.dart';
import 'package:sei_services/src/core/domain/entities/transaction_entity.dart';
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
    required ownerId,
    required ownerEmail,
    required codigoNotaFiscal,
    required isOwner,
    required cpf
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
    ownerId: ownerId,
    ownerEmail: ownerEmail,
    codigoNotaFiscal: codigoNotaFiscal,
    isOwner: isOwner,
    cpf: cpf
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'transactionId': transactionId,
      'accountNumber': accountNumber,
      'transactionType': transactionType,
      'transactionAmount': transactionAmount,
      'expenseType': expenseType,
      'sellDate': sellDate,
      'storeName': storeName,
      'totalTaxes': totalTaxes,
      'expenseGroupId': expenseGroupId,
      'ownerId': ownerId,
      'ownerEmail': ownerEmail,
      'codigoNotaFiscal': codigoNotaFiscal,
      'isOwner': isOwner ? 1 : 0,
      'cpf': cpf
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
        transactionId: FromApiTypeUtil.toSafeString(map["transactionId"]),
        expenseGroupId: FromApiTypeUtil.toSafeString(map["expenseGroupId"]),
        accountNumber: FromApiTypeUtil.toInt(map["accountNumber"]),
        transactionType: map["transactionType"],
        transactionAmount: FromApiTypeUtil.toDouble(map['transactionAmount']),
        expenseType: FromApiTypeUtil.toSafeString(map['expenseType']),
        storeName: FromApiTypeUtil.toSafeString(map['storeName']),
        sellDate: FromApiTypeUtil.toSafeString(map['sellDate']),
        totalTaxes: FromApiTypeUtil.toDouble(map['totalTaxes']),
        ownerId: FromApiTypeUtil.toInt(map["ownerId"]),
        ownerEmail: FromApiTypeUtil.toSafeString(map["ownerEmail"]),
        codigoNotaFiscal: FromApiTypeUtil.toSafeString(map["codigoNotaFiscal"]),
        isOwner: FromApiTypeUtil.toBool(map["isOwner"]),
        cpf: FromApiTypeUtil.toSafeString(map["cpf"])
    );
  }
}