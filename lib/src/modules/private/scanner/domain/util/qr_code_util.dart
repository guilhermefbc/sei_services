import 'package:sei_services/src/modules/private/scanner/domain/util/formatter_scanner_util.dart';

class QrCodeUtil {
  // static bool _isValidStateUFCode(String code) {
  //   List<String> validStateUFCode = [".df", ".pi.", ".pe.", ".se.", ".pr.", ".rn.", ".go.", ".rs.", ".rj.", ".es.",".ma.",".mg.",".sp.",".ba."];
  //   return validStateUFCode.any((uf) => code.contains(uf));
  // }
  //
  // static bool _isValidState(String code) {
  //   List<String> validStates = ["53", "25", "26", "22", "28", "41", "24","52","43", "33","32","21","31","35","29"];
  //   return validStates.contains(FormatterScannerUtil.toStateCode(code));
  // }

  // static bool _isValidQRCode(String code) {
  //   return _isValidState(code) || _isValidStateUFCode(code);
  // }

  static String getQRCode(String code) {
    return FormatterScannerUtil.extractCodeNumberByQRData(code);
  }
}
