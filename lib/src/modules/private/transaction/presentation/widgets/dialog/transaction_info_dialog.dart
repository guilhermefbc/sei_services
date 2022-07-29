import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/presentation/widgets/dialogs/info_dialog.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class TransactionsInfoDialog extends StatefulWidget {
  final TransactionEntity transaction;

  const TransactionsInfoDialog({Key? key, required this.transaction})
      : super(key: key);

  @override
  State<TransactionsInfoDialog> createState() => _TransactionsInfoDialogState();
}

class _TransactionsInfoDialogState extends State<TransactionsInfoDialog> {
  @override
  Widget build(BuildContext context) {
    return InfoDialog(
        showCloseBtn: true,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 5).r,
          children: [
            _buildStoreName(),
            SizedBox(
              height: 20.h,
            ),
            _buildInfo('Valor', widget.transaction.transactionAmount,
                needFormat: true),
            _buildInfo('Impostos', widget.transaction.totalTaxes,
                needFormat: true),
            _buildInfo('Código', widget.transaction.codigoNotaFiscal),
            _buildInfo('Data', DateUtil.format(widget.transaction.sellDate)),
            _buildInfo('CPF', widget.transaction.cpf),
          ],
        ));
  }

  Widget _buildStoreName() {
    return Text(
      widget.transaction.storeName ?? '---',
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
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          Text(
            information,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
            overflow: TextOverflow.visible,
          )
        ],
      ),
    );
  }
}
