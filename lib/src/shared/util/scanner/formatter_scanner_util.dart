class FormatterScannerUtil {
  static String toStateCode(String code) {
    return extractCodeNumberByQRData(code).substring(0,2);
  }

  static String extractCodeNumberByQRData(String rawContent) {
    final int startIndex = rawContent.indexOf('=') + 1;
    final int endIndex = rawContent.indexOf('|');
    
    return rawContent.substring(startIndex, endIndex);
  }

  static String formatNumericCode(String? code) {
    if(code == null || code.isEmpty) {
      return '';
    }
    String formattedCode = '';
    for(int i = 1; i <= code.length; i++) {
      int idx = i-1;
      if(i%4==0) {
        formattedCode += '${code[idx]} ';
      }else{
        formattedCode += code[idx];
      }
    }
    return formattedCode;
  }
}