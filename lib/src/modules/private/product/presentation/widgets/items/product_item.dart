import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/product/presentation/widgets/dialog/product_info_dialog.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/theme/items_shadow.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class ProductItem extends StatefulWidget {
  final ProductEntity product;
  final TransactionEntity transaction;
  const ProductItem({Key? key, required this.product, required this.transaction}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showProductInfoDialog(context);
      },
      child: Container(
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
      ),
    );
  }

  Widget _buildToProductScreenIcon() {
    return InkWell(
      onTap: () {

      },
      child: CircleAvatar(
          radius: 20.r,
          backgroundColor: Colors.blueAccent,
          child: const Icon(Icons.add_shopping_cart_outlined,)
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
      MonetaryFormatterUtil.format(widget.product.price),
      style: TextStyle(
          color: Colors.green,
          fontSize: 30.sp,
          fontWeight: FontWeight.w500
      ),
    );
  }

  Widget _buildTaxValue() {
    String text = '---';
    if(widget.product.taxes > 0) {
      text = MonetaryFormatterUtil.format(widget.product.taxes);
    }
    return Text(
      text,
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
      widget.product.description ?? '---',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
    );
  }

  _showProductInfoDialog(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (inx) => ProductInfoDialog(product: widget.product)
    );
  }
}
