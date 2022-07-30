import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/amount_value_widget.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/taxes_value_widget.dart';

class TransactionsHeaderWidget extends StatefulWidget {
  const TransactionsHeaderWidget({Key? key}) : super(key: key);

  @override
  State<TransactionsHeaderWidget> createState() => _TransactionsHeaderWidgetState();
}

class _TransactionsHeaderWidgetState extends State<TransactionsHeaderWidget> {
  final TransactionController _controller =
  Modular.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AmountValueWidget(amount: _controller.filteredTransactionsTotal, color: Colors.white,),
        TaxesValueWidget(taxes: _controller.filteredTransactionsTaxesTotal, color: Colors.white,)
      ],
    );
  }
}
