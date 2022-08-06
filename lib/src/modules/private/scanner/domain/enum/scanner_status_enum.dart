extension ScannerStatusEnumExtension on ScannerStatusEnum {
  static const Map<String,ScannerStatusEnum> _map = {
    "success": ScannerStatusEnum.success,
    "offline": ScannerStatusEnum.offline,
    "invalidCode": ScannerStatusEnum.invalidCode,
    "invalidQRCode": ScannerStatusEnum.invalidQRCode,
    "invalidBarCode": ScannerStatusEnum.invalidBarCode,
    "invalidState": ScannerStatusEnum.invalidState,
    "repeated": ScannerStatusEnum.repeated,
    "error": ScannerStatusEnum.error,
  };

  static ScannerStatusEnum byKey(String key) {
    if(!_map.containsKey(key)) {
      return ScannerStatusEnum.error;
    }
    return _map[key]!;
  }

  get name {
    return toString().split('.').last;
  }
}


enum ScannerStatusEnum {
  success,
  offline,
  invalidCode,
  invalidQRCode,
  invalidBarCode,
  invalidState,
  repeated,
  error,
}