import 'package:sei_services/src/shared/util/from_api_util/convert_util.dart';

class FromApiTypeUtil {
  static toValidKey(Map<String, dynamic> map, String key) {
    if(map.containsKey(key)) {
      return map[key];
    }else{
      return null;
    }
  }

  static Map<String, dynamic> toSafeMap(Map<String,dynamic> map) {
    map.forEach((key, value) {
      if(map[key] == null) {
        map.remove(key);
      }
    });
    return map;
  }

  static String toSafeString(value, String defaultValue) {
    return toMyString(value, defaultValue: defaultValue)!;
  }

  static double toSafeDouble(value, double defaultValue) {
    return toDouble(value, defaultValue: defaultValue)!;
  }

  static bool toSafeBool(value, bool defaultValue) {
    return toBool(value, defaultValue: defaultValue)!;
  }

  static int toSafeInt(value, int defaultValue) {
    return toInt(value, defaultValue: defaultValue)!;
  }

  static double? toDouble(value, {double? defaultValue}) {
    return ConvertUtil.convertDoubleToAsFixed(_toDouble(value, defaultValue: defaultValue) ?? 0);
  }
  
  static double? _toDouble(value, {double? defaultValue}) {
    if(value == null) {
      return _forValueNull(defaultValue);
    } else if (value is String) {
      return double.tryParse(value) ?? 0;
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
      return _forValueNull(defaultValue);
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
      return _forValueNull(defaultValue);
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
      return _forValueNull(defaultValue);
    }else if(value is String) {
      return value;
    }else{
      return value.toString();
    }
  }

  static int? toInt(value, {int? defaultValue}) {
    if(value == null) {
      return _forValueNull(defaultValue);
    }else if(value is int) {
      return value;
    }else if(value is String) {
      return int.tryParse(value) ?? 0;
    }else if(value is bool) {
      return value ? 1 : 0;
    }else{
      throw Exception("Format error");
    }
  }

  static _forValueNull(defaultValue) {
    return defaultValue;
  }
}


















