class ProductEntity {
  String? productId;
  String? transactionId;
  String? description;
  String? eanCode;
  double? quantity;
  String? metric;
  double? price;
  String? productCode;
  String? genre;
  String? cfop;
  double? discount;
  double? approximateTaxation;
  String? productOrigin;
  double? icmsTaxation;
  bool? isFavorite = false;
  String? expenseType;
  bool? isStockable;
  bool? isMedicine;

  ProductEntity({
      required this.productId,
      required this.transactionId,
      required this.description,
      required this.eanCode,
      required this.quantity,
      required this.metric,
      required this.price,
      required this.productCode,
      required this.genre,
      required this.cfop,
      required this.discount,
      required this.approximateTaxation,
      required this.productOrigin,
      required this.icmsTaxation,
      required this.isFavorite,
      required this.expenseType,
      required this.isStockable,
      required this.isMedicine
  });

  double get taxes {
    if(approximateTaxation! > 0) {
      return approximateTaxation!;
    }
    return icmsTaxation!;
  }

  String get origin {
    bool isNational = productOrigin!.toUpperCase().contains('NACIONAL');
    if(isNational) {
      return 'Nacional';
    }
    return 'Importado';
  }
}