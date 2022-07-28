class FormatterScannerUtil {
  static String toStateCode(String code) {
    return extractCodeNumberByQRData(code).substring(0,2);
  }

  static String extractCodeNumberByQRData(String rawContent) {
    final int startIndex = rawContent.indexOf('=') + 1;
    final int endIndex = rawContent.indexOf('|');
    
    return rawContent.substring(startIndex, endIndex);
  }
}