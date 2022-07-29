import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/shared/domain/entities/product_entity.dart';
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
            _buildInfo('Preço', product.price, needFormat: true),
            _buildInfo('Imposto', product.taxes, needFormat: true),
            _buildInfo('EANCode', product.eanCode),
            _buildInfo('Quantidade', product.quantity),
            _buildInfo('Medida', product.metric),
            _buildInfo('Código do produto', product.productCode),
            _buildInfo('Genre', product.genre),
            _buildInfo('CFOP', product.cfop),
            _buildInfo('Desconto', product.discount, needFormat: true),
            _buildInfo('Imposto ICMS', product.icmsTaxation, needFormat: true),
            _buildInfo('Tipo de gasto', product.expenseType,),
            _buildInfo('É medicamento', product.isMedicine! ? 'Sim' : 'Não'),
            _buildInfo('Origem do produto', product.origin),
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
