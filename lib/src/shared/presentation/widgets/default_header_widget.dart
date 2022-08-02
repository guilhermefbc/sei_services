import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/amount_value_widget.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/taxes_value_widget.dart';

class DefaultHeaderWidget extends StatefulWidget {
  double amount;
  double taxes;
  DefaultHeaderWidget({Key? key, required this.amount, required this.taxes}) : super(key: key);

  @override
  State<DefaultHeaderWidget> createState() => _DefaultHeaderWidgetState();
}

class _DefaultHeaderWidgetState extends State<DefaultHeaderWidget> {
  final TransactionController _controller =
  Modular.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text('Total valor', style: TextStyle(fontSize: 12.sp),),
            AmountValueWidget(amount: widget.amount, color: Colors.white,),
          ],
        ),
        Column(
          children: [
            Text('Total impostos', style: TextStyle(fontSize: 12.sp),),
            TaxesValueWidget(taxes: widget.taxes, color: Colors.white,),
          ],
        )
      ],
    );
  }
}
