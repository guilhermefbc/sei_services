import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/items/tab_bar_item.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/items/transaction_item.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/lists/transactions_item_list_widget.dart';
import 'package:sei_services/src/shared/domain/bridges/get_transaction_bridge.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';
import 'package:sei_services/src/shared/util/date/date_util.dart';
import 'package:sei_services/src/shared/util/monetary/monetary_formatter_util.dart';

class TransactionOverviewScreen extends StatefulWidget {
  const TransactionOverviewScreen({Key? key}) : super(key: key);

  @override
  State<TransactionOverviewScreen> createState() =>
      _TransactionOverviewScreenState();
}

class _TransactionOverviewScreenState extends State<TransactionOverviewScreen> {
  final GetTransactionBridge _bridge = Modular.get<GetTransactionBridge>();
  final TransactionsRepository _transactions =
      Modular.get<TransactionsRepository>();
  final TransactionController _controller =
      Modular.get<TransactionController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bridge.fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      List<DateTime> dates = _controller.transactionsDates;
      return DefaultTabController(
        key: ValueKey(dates.toString()),
        initialIndex: dates.length-1,
        length: dates.length,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            toolbarHeight: 80.h,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(MonetaryFormatterUtil.format(
                    _controller.filteredTransactionsTotal)),
                Text(MonetaryFormatterUtil.format(
                    _controller.filteredTransactionsTaxesTotal)),
              ],
            ),
            bottom: TabBar(
              tabs: dates.map((date) {
                return TabBarItem(date: date);
              }).toList(),
            ),
          ),
          body: TabBarView(
            children: dates.map((date) {
              return TransactionsItemListWidget(date: date);
            }).toList(),
          ),
        ),
      );
    });
  }
}
