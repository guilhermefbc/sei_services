import 'package:sei_services/src/shared/domain/entities/product_entity.dart';

class TransactionEntity {
  String? transactionId;
  String? expenseGroupId;
  int? accountNumber;
  String? transactionType;
  double? transactionAmount;
  String? expenseType;
  String? storeName;
  DateTime? sellDate;
  double? totalTaxes;
  int? ownerId;
  String? codigoNotaFiscal;
  String? cpf;
  List<ProductEntity>? products;

  TransactionEntity({
      required this.transactionId,
      required this.expenseGroupId,
      required this.accountNumber,
      required this.transactionType,
      required this.transactionAmount,
      required this.expenseType,
      required this.storeName,
      required this.sellDate,
      required this.totalTaxes,
      required this.codigoNotaFiscal,
      required this.cpf,
  });

}