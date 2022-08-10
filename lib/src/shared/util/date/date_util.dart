import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

class DateUtil {
  static final _dayFormatter = DateFormat.yMd('lang'.i18n()).add_jm();
  static final _monthFormatter = DateFormat.MMM('lang'.i18n());
  static final _yearFormatter = DateFormat.y('lang'.i18n());

  static String format(DateTime? date) {
    if (date == null) {
      return '-/-/-';
    }
    return _dayFormatter.format(date);
  }

  static List<DateTime> getDefaultMonths() {
    DateTime now = DateTime.now();
    List<DateTime> defaultDates = [
      DateTime(now.year, now.month - 2),
      DateTime(now.year, now.month - 1),
      now,
    ];
    return defaultDates;
  }

  static List<DateTime> getValidMonths(List<DateTime> dates) {
    List<String> uniqueMonthYear = [];
    List<DateTime> uniqueDates = dates.where((date) {
      String monthYear = formatMonthYear(date);
      if (uniqueMonthYear.contains(monthYear)) {
        return false;
      } else {
        uniqueMonthYear.add(monthYear);
        return true;
      }
    }).toList();
    uniqueDates.sort();
    return uniqueDates;
  }

  static String formatMonthYear(DateTime date, {bool withoutThisYear = false}) {
    final String month = _monthFormatter.format(date).toUpperCase();
    final String year = _yearFormatter.format(date).toUpperCase();
    final String decadeYear = year.substring(2, 4);
    if (withoutThisYear) {
      return isCurrentYear(date) ? month : '$month/$decadeYear';
    } else {
      return '$month/$decadeYear';
    }
  }

  static bool isCurrentYear(DateTime date) {
    return date.year == DateTime.now().year;
  }
}
