import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

class MonetaryFormatterUtil {
  static final CurrencyTextInputFormatter _formatter = CurrencyTextInputFormatter(
    locale: 'br',
    decimalDigits: 2,
    symbol: 'R\$',
  );

  static String format(num? value) {
    if(value == null) {
      return '--';
    }
    return _formatter.format(value.toString());
  }
}