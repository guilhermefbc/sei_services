class ConvertUtil {

  /// By default the number will be fixed with 2
  static double convertDoubleToAsFixed(double value, {int? fractionDigits}) {
    const defaultFixed = 2;
    String intermediary = value.toStringAsFixed(fractionDigits ?? defaultFixed);
    return double.parse(intermediary);
  }
}