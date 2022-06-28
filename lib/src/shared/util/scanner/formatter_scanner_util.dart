class FormatterScannerUtil {
  static String toCodeNumber(String rawContent) {
    if(_isQRCodeData(rawContent)){
      return _extractCodeNumberByQRData(rawContent);
    } else{
      return rawContent;
    }
  }

  static String toStateCode(String rawContent) {
    return toCodeNumber(rawContent).substring(0,2);
  }

  static bool _isQRCodeData(String rawContent) {
    return rawContent.length > 44;
  }
  
  static String _extractCodeNumberByQRData(String rawContent) {
    int startIndex = rawContent.indexOf('=') + 1;
    int endIndex = rawContent.indexOf('|');
    
    return rawContent.substring(startIndex, endIndex);
  }
}