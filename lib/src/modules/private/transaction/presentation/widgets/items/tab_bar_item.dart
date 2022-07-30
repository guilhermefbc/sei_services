import 'package:flutter/material.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';

class TabBarItem extends StatelessWidget {
  final DateTime date;
  const TabBarItem({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
          DateUtil.formatMonthYear(date, withoutThisYear: true)),
    );
  }
}
