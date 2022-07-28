import 'package:sei_services/src/shared/domain/entities/product_entity.dart';
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
  
  factory ProductModel.fromMap(Map map) {
    return ProductModel(
      productId: FromApiTypeUtil.toMyString(map['productId']), 
      transactionId: FromApiTypeUtil.toMyString(map['transactionId']), 
      description: FromApiTypeUtil.toMyString(map['description']), 
      eanCode: FromApiTypeUtil.toMyString(map['eanCode']), 
      quantity: FromApiTypeUtil.toDouble(map['quantity']), 
      metric: FromApiTypeUtil.toMyString(map['metric']), 
      price: FromApiTypeUtil.toDouble(map['price']),
      productCode: FromApiTypeUtil.toMyString(map['productCode']),
      genre: FromApiTypeUtil.toMyString(map['genre']),
      cfop: FromApiTypeUtil.toMyString(map['cfop']),
      discount: FromApiTypeUtil.toDouble(map['discount']),
      approximateTaxation: FromApiTypeUtil.toDouble(map['approximateTaxation']),
      productOrigin: FromApiTypeUtil.toMyString(map['productOrigin']),
      icmsTaxation: FromApiTypeUtil.toDouble(map['icmsTaxation']),
      isFavorite: FromApiTypeUtil.toBool(map['isFavorite'], defaultValue: false),
      expenseType: FromApiTypeUtil.toMyString(map['expenseType']),
      isStockable: FromApiTypeUtil.toBool(map['isStockable'], defaultValue: false),
      isMedicine: FromApiTypeUtil.toBool(map['isMedicine'], defaultValue: false)
    );
  }

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      "productId": productId,
      "transactionId": transactionId,
      "description": description,
      "eanCode": eanCode,
      "quantity": quantity,
      "metric": metric,
      "price": price,
      "productCode": productCode,
      "genre": genre,
      "cfop": cfop,
      "discount": discount,
      "approximateTaxation": approximateTaxation,
      "productOrigin": productOrigin,
      "icmsTaxation": icmsTaxation,
      "isFavorite": isFavorite,
      "expenseType": expenseType,
      "isStockable": isStockable,
      "isMedicine": isMedicine
    };
  }
}