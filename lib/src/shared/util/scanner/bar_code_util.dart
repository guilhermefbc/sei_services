class BarCodeUtil {
  static bool is55barcodeCase(String rawContent) {
    var substringCodeNumber = rawContent.substring(20,22);
    return substringCodeNumber == "55";
  }
}