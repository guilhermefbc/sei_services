import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class TaxesValueWidget extends StatefulWidget {
  final double taxes;
  final TextStyle? style;
  final Color? color;
  const TaxesValueWidget({
    Key? key,
    required this.taxes,
    this.style,
    this.color
  }) : super(key: key);

  @override
  State<TaxesValueWidget> createState() => _TaxesValueWidgetState();
}

class _TaxesValueWidgetState extends State<TaxesValueWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      MonetaryFormatterUtil.format(widget.taxes),
      style: widget.style ?? TextStyle(
          color: widget.color ?? Colors.redAccent,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500
      ),
    );
  }
}
