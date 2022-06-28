import 'package:sei_services/src/shared/util/scanner/formatter_scanner_util.dart';

class QrCodeUtil {
  static bool isValidStateUFCode(String rawContent) {
    List<String> validStateUFCode = [".df", ".pi.", ".pe.", ".se.", ".pr.", ".rn.", ".go.", ".rs.", ".rj.", ".es.",".ma.",".mg.",".sp.",".ba."];
    return validStateUFCode.any((uf) => rawContent.contains(uf));
  }

  static bool isValidState(String rawContent) {
    List<String> validStates = ["53", "25", "26", "22", "28", "41", "24","52","43", "33","32","21","31","35","29"];
    return validStates.contains(FormatterScannerUtil.toStateCode(rawContent));
  }
}