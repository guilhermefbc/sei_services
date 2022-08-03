import 'package:sei_services/src/modules/private/scanner/domain/util/formatter_scanner_util.dart';

class QrCodeUtil {
  // static bool _isValidStateUFCode(String code) {
  //   List<String> validStateUFCode = [".df", ".pi.", ".pe.", ".se.", ".pr.", ".rn.", ".go.", ".rs.", ".rj.", ".es.",".ma.",".mg.",".sp.",".ba."];
  //   return validStateUFCode.any((uf) => code.contains(uf));
  // }
  //
  static bool _isValidState(String code) {
    List<String> validStates = ["53", "25", "26", "22", "28", "41", "24","52","43", "33","32","21","31","35","29"];
    return validStates.contains(FormatterScannerUtil.toStateCode(code));
  }

  static bool _isManualCode(String code) {
    return code.length == 44;
  }

  static bool _isHttpOfScannerCode(String code) {
    return code.length > 44;
  }

  static String _toValidManualCode(String code) {
    return _isValidState(code) ? code : 'invalidState';
  }

  static String _toValidScannerCode(String code) {
    final String formattedCode = FormatterScannerUtil.extractCodeNumberByQRData(code);
    if(formattedCode.length != 44) {
      return 'error';
    }
    return _isValidState(formattedCode) ? formattedCode : 'invalidState';
  }

  static String getQRCode(String code) {
    if(_isManualCode(code)) {
      return _toValidManualCode(code);
    }else if(_isHttpOfScannerCode(code)) {
      return _toValidScannerCode(code);
    }else {
      return 'error';
    }
  }
}
