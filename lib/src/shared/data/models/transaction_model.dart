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
    // required ownerId,
    // required ownerEmail,
    required codigoNotaFiscal,
    // required isOwner,
    required cpf,
    products
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
    // ownerId: ownerId,
    // ownerEmail: ownerEmail,
    codigoNotaFiscal: codigoNotaFiscal,
    // isOwner: isOwner,
    cpf: cpf,
    products: products
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
      // 'ownerId': ownerId,
      // 'ownerEmail': ownerEmail,
      // 'codigoNotaFiscal': codigoNotaFiscal,
      // 'isOwner': isOwner ? 1 : 0,
      'cpf': cpf
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
        transactionId: FromApiTypeUtil.toSafeString(map["_id"]),
        expenseGroupId: FromApiTypeUtil.toSafeString(map["groupId"]),
        accountNumber: FromApiTypeUtil.toInt(map["accountNumber"]),
        transactionType: map["TransactionType"],
        transactionAmount: FromApiTypeUtil.toDouble(map['transactionAmount']),
        expenseType: FromApiTypeUtil.toSafeString(map['expenseType']),
        storeName: FromApiTypeUtil.toSafeString(map['Store']),
        sellDate: FromApiTypeUtil.toDateTime(map['sellDate']),
        totalTaxes: FromApiTypeUtil.toDouble(map['totalTaxes']),
        // ownerId: FromApiTypeUtil.toInt(map["ownerId"]),
        // ownerEmail: FromApiTypeUtil.toSafeString(map["ownerEmail"]),
        codigoNotaFiscal: FromApiTypeUtil.toSafeString(map["codigoNotaFiscal"]),
        // isOwner: FromApiTypeUtil.toBool(map["isOwner"]),
        cpf: FromApiTypeUtil.toSafeString(map["cpf"]),
        products: FromApiTypeUtil.toProductEntityList(map["Products"][0])
    );
  }
}