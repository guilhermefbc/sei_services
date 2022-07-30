import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class MonetaryFormatterUtil {
  static final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    locale: 'pt_BR',
    decimalDigits: 2,
    symbol: 'R\$',
  );

  static String format(double? value) {
    if(value == null) {
      return '--';
    }
    final String asFixed2 = value.toStringAsFixed(2);
    return _formatter.format(asFixed2);
  }
}