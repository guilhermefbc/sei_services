import 'package:intl/intl.dart';

class DateUtil {
  static final _dayFormatter = DateFormat.yMd().add_jm();

  static String format(DateTime? date) {
    if(date == null) {
      return '-/-/-';
    }
    return _dayFormatter.format(date);
  }
}