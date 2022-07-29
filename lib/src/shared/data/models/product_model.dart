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
      productId: FromApiTypeUtil.toMyString(map['productId'], defaultValue: '---'),
      transactionId: FromApiTypeUtil.toMyString(map['transactionId'], defaultValue: '---'),
      description: FromApiTypeUtil.toMyString(map['description'], defaultValue: '---'),
      eanCode: FromApiTypeUtil.toMyString(map['eanCode'], defaultValue: '---'),
      quantity: FromApiTypeUtil.toDouble(map['quantity'], defaultValue: 0),
      metric: FromApiTypeUtil.toMyString(map['metric'], defaultValue: '---'),
      price: FromApiTypeUtil.toDouble(map['price'], defaultValue: 0),
      productCode: FromApiTypeUtil.toMyString(map['productCode'], defaultValue: '---'),
      genre: FromApiTypeUtil.toMyString(map['genre'], defaultValue: '---'),
      cfop: FromApiTypeUtil.toMyString(map['cfop'], defaultValue: '---'),
      discount: FromApiTypeUtil.toDouble(map['discount'], defaultValue: 0),
      approximateTaxation: FromApiTypeUtil.toDouble(map['approximateTaxation'], defaultValue: 0),
      productOrigin: FromApiTypeUtil.toMyString(map['productOrigin'], defaultValue: '---'),
      icmsTaxation: FromApiTypeUtil.toDouble(map['icmsTaxation'], defaultValue: 0),
      isFavorite: FromApiTypeUtil.toBool(map['isFavorite'], defaultValue: false),
      expenseType: FromApiTypeUtil.toMyString(map['expenseType'], defaultValue: '---'),
      isStockable: FromApiTypeUtil.toBool(map['isStockable'], defaultValue: false),
      isMedicine: FromApiTypeUtil.toBool(map['isMedicine'], defaultValue: false)
    );
  }

  Map<String,dynamic> toMap() {
    return <String,dynamic>{
      "productId": FromApiTypeUtil.toMyString(productId,defaultValue: '---'),
      "transactionId": FromApiTypeUtil.toMyString(transactionId, defaultValue: '---'),
      "description": FromApiTypeUtil.toMyString(description, defaultValue: '---'),
      "eanCode": FromApiTypeUtil.toMyString(eanCode, defaultValue: '---'),
      "quantity": FromApiTypeUtil.toDouble(quantity),
      "metric": FromApiTypeUtil.toMyString(metric, defaultValue: '---'),
      "price": FromApiTypeUtil.toDouble(price, defaultValue: 0),
      "productCode": FromApiTypeUtil.toMyString(productCode, defaultValue: '---'),
      "genre": FromApiTypeUtil.toMyString(genre, defaultValue: '---'),
      "cfop": FromApiTypeUtil.toMyString(cfop, defaultValue: '---'),
      "discount": FromApiTypeUtil.toDouble(discount, defaultValue: 0),
      "approximateTaxation": FromApiTypeUtil.toDouble(approximateTaxation, defaultValue: 0),
      "productOrigin": FromApiTypeUtil.toMyString(productOrigin, defaultValue: '---'),
      "icmsTaxation": FromApiTypeUtil.toDouble(icmsTaxation),
      "isFavorite": FromApiTypeUtil.toInt(isFavorite, defaultValue: 0),
      "expenseType": FromApiTypeUtil.toMyString(expenseType, defaultValue: '---'),
      "isStockable": FromApiTypeUtil.toInt(isStockable, defaultValue: 0),
      "isMedicine": FromApiTypeUtil.toInt(isMedicine, defaultValue: 0)
    };
  }
}