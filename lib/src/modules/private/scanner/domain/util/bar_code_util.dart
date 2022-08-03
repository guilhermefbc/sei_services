class BarCodeUtil {
  static const int _numberOfBarCodeDecimals = 44;

  static bool isBarCode(String code) {
    return _hasBarCodeSize(code) && _is55barcodeCase(code);
  }

  static bool _is55barcodeCase(String code) {
    var substringCodeNumber = code.substring(20,22);
    return substringCodeNumber == "55";
  }
  
  static bool _hasBarCodeSize(String code) {
    return code.length == _numberOfBarCodeDecimals;
  }
}