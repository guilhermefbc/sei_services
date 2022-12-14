import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/private/product/domain/repositories/products_repository.dart';
import 'package:sei_services/src/modules/private/product/presentation/controller/product/product_controller.dart';
import 'package:sei_services/src/modules/private/product/presentation/widgets/dialog/product_info_dialog.dart';
import 'package:sei_services/src/modules/private/transaction/domain/repositories/transactions_repository.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/amount_value_widget.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/taxes_value_widget.dart';
import 'package:sei_services/src/modules/private/product/domain/entities/product_entity.dart';
import 'package:sei_services/src/modules/private/transaction/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/delete_dialog.dart';
import 'package:sei_services/src/shared/theme/items_shadow.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';

class ProductItem extends StatefulWidget {
  final ProductEntity product;
  final TransactionEntity transaction;
  const ProductItem({Key? key, required this.product, required this.transaction}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final ProductsRepository _repository = Modular.get<ProductsRepository>();
  final ProductController _controller = Modular.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _showDeleteDialog(context);
      },
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
                    title: "value".i18n(),
                    child: AmountValueWidget(amount: widget.product.price!),
                    color: Colors.green
                ),
                _buildValueBloc(
                    title: "tax".i18n(),
                    child: TaxesValueWidget(taxes: widget.product.taxes),
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

  _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return DeleteDialog(
              buttonOnPressed1: (){},
              buttonOnPressed2: () {
                _repository.deleteProduct(widget.product);
                _controller.removeProduct(widget.product);
              }
          );
        }
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
