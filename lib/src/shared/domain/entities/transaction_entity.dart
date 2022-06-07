class TransactionEntity {
  String transactionId;
  String expenseGroupId;
  int accountNumber;
  String transactionType;
  double transactionAmount;
  String expenseType;
  String storeName;
  String sellDate;
  double totalTaxes;
  int ownerId;
  String ownerEmail;
  String codigoNotaFiscal;
  bool isOwner;
  String cpf;

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
      required this.ownerId,
      required this.ownerEmail,
      required this.codigoNotaFiscal,
      required this.isOwner,
      required this.cpf
  });

}