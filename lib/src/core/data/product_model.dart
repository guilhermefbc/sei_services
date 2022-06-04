import 'package:sei_services/src/core/domain/entities/product_entity.dart';
import 'package:sei_services/src/shared/util/from_api_util/from_api_type_util.dart';

class ProductModel extends ProductEntity{
  ProductModel({
    required productId,
    required transactionId,
    required description,
    required eanCode,
    required quantity,
    required metric,
    required price,
    required productCode,
    required genre,
    required cfop,
    required discount,
    required approximateTaxation,
    required productOrigin,
    required icmsTaxation,
    required isFavorite,
    required expenseType,
    required isStockable,
    required isMedicine
  }) : super(
    productId: productId,
    transactionId: transactionId,
    description: description,
    eanCode: eanCode,
    quantity: quantity,
    metric: metric,
    price: price,
    productCode: productCode,
    genre: genre,
    cfop: cfop,
    discount: discount,
    approximateTaxation: approximateTaxation,
    productOrigin: productOrigin,
    icmsTaxation: icmsTaxation,
    isFavorite: isFavorite,
    expenseType: expenseType,
    isStockable: isStockable,
    isMedicine: isMedicine
  );
  
  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      productId: FromApiTypeUtil.toSafeString(map['productId']), 
      transactionId: FromApiTypeUtil.toSafeString(map['transactionId']), 
      description: FromApiTypeUtil.toSafeString(map['description']), 
      eanCode: FromApiTypeUtil.toSafeString(map['eanCode']), 
      quantity: FromApiTypeUtil.toDouble(map['quantity']), 
      metric: FromApiTypeUtil.toSafeString(map['metric']), 
      price: FromApiTypeUtil.toDouble(map['price']),
      productCode: FromApiTypeUtil.toSafeString(map['productCode']),
      genre: FromApiTypeUtil.toSafeString(map['genre']),
      cfop: FromApiTypeUtil.toSafeString(map['cfop']),
      discount: FromApiTypeUtil.toDouble(map['discount']),
      approximateTaxation: FromApiTypeUtil.toDouble(map['approximateTaxation']),
      productOrigin: FromApiTypeUtil.toSafeString(map['productOrigin']),
      icmsTaxation: FromApiTypeUtil.toDouble(map['icmsTaxation']),
      isFavorite: FromApiTypeUtil.toBool(map['isFavorite']),
      expenseType: FromApiTypeUtil.toSafeString(map['expenseType']),
      isStockable: FromApiTypeUtil.toBool(map['isStockable']),
      isMedicine: FromApiTypeUtil.toBool(map['isMedicine'])
    );
  }
}