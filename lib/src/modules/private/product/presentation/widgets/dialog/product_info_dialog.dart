import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:localization/localization.dart';
import 'package:sei_services/src/modules/private/product/domain/entities/product_entity.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/info_dialog.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class ProductInfoDialog extends StatelessWidget {
  final ProductEntity product;
  const ProductInfoDialog({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InfoDialog(
        showCloseBtn: true,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5).r,
          children: [
            _buildStoreName(),
            SizedBox(height: 20.h,),
            _buildInfo('price'.i18n(), product.price, needFormat: true),
            _buildInfo('tax'.i18n(), product.taxes, needFormat: true),
            _buildInfo('EANCode'.i18n(), product.eanCode),
            _buildInfo('productAmount'.i18n(), product.quantity),
            _buildInfo('measure'.i18n(), product.metric),
            _buildInfo('productCode'.i18n(), product.productCode),
            _buildInfo('genre'.i18n(), product.genre),
            _buildInfo('CFOP'.i18n(), product.cfop),
            _buildInfo('discount'.i18n(), product.discount, needFormat: true),
            _buildInfo('ICMSTax'.i18n(), product.icmsTaxation, needFormat: true),
            _buildInfo('typeOfExpense'.i18n(), product.expenseType,),
            _buildInfo('ItsMedicine'.i18n(), product.isMedicine! ? 'yes'.i18n() : 'no'.i18n()),
            _buildInfo('productOrigin'.i18n(), product.origin),
          ],
        )
    );
  }

  Widget _buildStoreName() {
    return Text(
      product.description ?? '---',
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      overflow: TextOverflow.visible,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildInfo(String name, info, {bool needFormat = false}) {
    final String information =
    needFormat ? MonetaryFormatterUtil.format(info) : info.toString();
    return Padding(
      padding: const EdgeInsets.only(bottom: 3).r,
      child: Row(
        children: [
          Text(
            '$name: ',
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              information,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
              overflow: TextOverflow.visible,
            ),
          )
        ],
      ),
    );
  }
}
