import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/items/transaction_item.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';

class TransactionsItemListWidget extends StatefulWidget {
  final DateTime date;

  const TransactionsItemListWidget({Key? key, required this.date})
      : super(key: key);

  @override
  State<TransactionsItemListWidget> createState() =>
      _TransactionsItemListWidgetState();
}

class _TransactionsItemListWidgetState
    extends State<TransactionsItemListWidget> {
  final TransactionsRepository _transactions =
      Modular.get<TransactionsRepository>();
  final TransactionController _controller =
      Modular.get<TransactionController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _transactions.getTransactionsByYearMonth(widget.date),
      builder: (ctx, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        _controller.addFilteredTransactions(snapshot.data! as List<TransactionEntity>);
        return ListView(
          padding: const EdgeInsets.only(top: 10).r,
          children: _controller.filteredTransactions.map<Widget>(
                  (transaction) => TransactionItem(transaction: transaction))
              .toList(),
        );
      },
    );
  }
}
