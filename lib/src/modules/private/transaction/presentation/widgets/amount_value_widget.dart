import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class AmountValueWidget extends StatefulWidget {
  final double amount;
  final TextStyle? style;
  final Color? color;
  const AmountValueWidget({
    Key? key,
    required this.amount,
    this.style,
    this.color
  }) : super(key: key);

  @override
  State<AmountValueWidget> createState() => _AmountValueWidgetState();
}

class _AmountValueWidgetState extends State<AmountValueWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      MonetaryFormatterUtil.format(widget.amount),
      style: widget.style ?? TextStyle(
          color: widget.color ?? Colors.green,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500
      ),
    );
  }
}
