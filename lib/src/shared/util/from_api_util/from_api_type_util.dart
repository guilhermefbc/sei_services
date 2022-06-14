import 'package:sei_services/src/shared/data/models/product_model.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';
import 'package:sei_services/src/shared/util/from_api_util/convert_util.dart';

class FromApiTypeUtil {
  static List<ProductEntity> toProductEntityList(List<Map<String,dynamic>> products) {
    return products.map((product) => ProductModel.fromMap(product)).toList();
  }

  static double toDouble(Object? value, {double? defaultValue}) {
    return ConvertUtil.convertDoubleToAsFixed(_toDouble(value, defaultValue: defaultValue));  
  }
  
  static double _toDouble(Object? value, {double? defaultValue}) {
    if(value == null) {
      return defaultValue ?? 0.0;
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

  /// ATTENTION!
  /// If value is null will be returned
  /// the current DateTime
  static DateTime toDateTime(Object? value, {DateTime? defaultValue}) {
    if(value == null){
      return defaultValue ?? DateTime.now();
    }else if(value is String) {
      return DateTime.parse(value);
    }else if(value is DateTime){
      return value;
    }else{
      throw Exception("Format error");
    }
  }

  static bool toBool(Object? value, {bool? defaultValue}) {
    if(value == null) {
      return defaultValue ?? false;
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

  static String toSafeString(Object? value, {String? defaultValue}) {
    if(value == null) {
      return defaultValue ?? '';
    }else if(value is String) {
      return value;
    }else{
      return value.toString();
    }
  }

  static int toInt(Object? value, {int? defaultValue}) {
    if(value == null) {
      return defaultValue ?? 0;
    }else if(value is int) {
      return value;
    }else if(value is String) {
      return int.parse(value);
    }else{
      throw Exception("Format error");
    }
  }
}


















