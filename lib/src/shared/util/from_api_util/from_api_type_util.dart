import 'package:sei_services/src/shared/data/models/product_model.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';
import 'package:sei_services/src/shared/util/from_api_util/convert_util.dart';

class FromApiTypeUtil {
  static toValidKey(Map<String, dynamic> map, String key) {
    if(map.containsKey(key)) {
      return map[key];
    }else{
      return null;
    }
  }

  static List<ProductEntity> toProductEntityList(List<List>? products) {
    if(products == null) {
      return [];
    }
    return products[0].map((product) => ProductModel.fromMap(product)).toList();
  }

  static double? toDouble(value, {double? defaultValue}) {
    return ConvertUtil.convertDoubleToAsFixed(_toDouble(value, defaultValue: defaultValue) ?? 0);
  }
  
  static double? _toDouble(value, {double? defaultValue}) {
    if(value == null) {
      return value;
    } else if (value is String) {
      return double.parse(value);
    } else if (value is double) {
      return value;
    } else if (value is int) {
      return value.toDouble();
    } else {
      throw Exception("Format error");
    }
  }


  static DateTime? toDateTime(value, {DateTime? defaultValue}) {
    if(value == null){
      return value;
    }else if(value is String) {
      return DateTime.parse(value);
    }else if(value is DateTime){
      return value;
    }else{
      throw Exception("Format error");
    }
  }

  static bool? toBool(value, {bool? defaultValue}) {
    if(value == null) {
      return value;
    }else if(value is bool) {
      return value;
    }else if(value is int) {
      return value == 1;
    }else if(value is String) {
      return value == '1';
    }else{
      throw Exception("Format error");
    }
  }

  static String? toMyString(value, {String? defaultValue}) {
    if(value == null) {
      return value;
    }else if(value is String) {
      return value;
    }else{
      return value.toString();
    }
  }

  static int? toInt(value, {int? defaultValue}) {
    if(value == null) {
      return value;
    }else if(value is int) {
      return value;
    }else if(value is String) {
      return int.parse(value);
    }else{
      throw Exception("Format error");
    }
  }
}


















