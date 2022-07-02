import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/theme/items_shadow.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class TransactionItem extends StatefulWidget {
  final TransactionEntity transaction;
  const TransactionItem({
    Key? key,
    required this.transaction
  }) : super(key: key);

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          ItemsBoxShadow.boxShadow
        ]
      ),
      child: Row(
        children: [

        ],
      ),
    );
  }

  Widget _buildTransactionValue() {
    return Text(
      MonetaryFormatterUtil.format(widget.transaction.transactionAmount),
      style: TextStyle(
        color: Colors.green,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _buildTaxValue() {
    return Text(
      MonetaryFormatterUtil.format(widget.transaction.totalTaxes),
      style: TextStyle(
          color: Colors.green,
          fontSize: 30.sp,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget _buildDate() {
    return Text(DateUtil.format(widget.transaction.sellDate));
  }

  Widget _storeName() {
    return Text(
      widget.transaction.storeName ?? '-'
    );
  }
}
