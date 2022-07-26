import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5).r,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10).r,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            ItemsBoxShadow.boxShadow
          ]
      ),
      child: Column(
        children: [
          _buildStoreName(),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildValueBloc(
                  title: "Valor",
                  child: _buildTransactionValue(),
                  color: Colors.green
              ),
              _buildValueBloc(
                  title: "Impostos",
                  child: _buildTaxValue(),
                  color: Colors.redAccent
              ),
            ],
          ),
          SizedBox(height: 15.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDate(),
              _buildToProductScreenIcon()
            ],
          )
        ],
      ),
    );
  }

  Widget _buildToProductScreenIcon() {
    return InkWell(
      onTap: () {
        Modular.to.pushNamed('/private/transaction/product', arguments: widget.transaction);
      },
      child: CircleAvatar(
          radius: 20.r,
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add_shopping_cart)
      ),
    );
  }

  Widget _buildValueBloc({required String title, required Widget child, Color? color,}) {
    return Column(
      children: [
        Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w400,),),
        child
      ],
    );
  }

  Widget _buildTransactionValue() {
    return Text(
      MonetaryFormatterUtil.format(widget.transaction.transactionAmount),
      style: TextStyle(
          color: Colors.green,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _buildTaxValue() {
    return Text(
      MonetaryFormatterUtil.format(widget.transaction.totalTaxes),
      style: TextStyle(
          color: Colors.redAccent,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _buildDate() {
    return Text(DateUtil.format(widget.transaction.sellDate));
  }

  Widget _buildStoreName() {
    return Text(
        widget.transaction.storeName ?? '---',
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
        overflow: TextOverflow.visible,
        textAlign: TextAlign.center,
    );
  }
}
