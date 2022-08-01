import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/processing/presentation/screens/processing_list_screen.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/items/tab_bar_item.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/lists/transactions_item_list_widget.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/transaction_header_widget.dart';
import 'package:sei_services/src/shared/domain/bridges/get_transaction_bridge.dart';

class TransactionOverviewScreen extends StatefulWidget {
  const TransactionOverviewScreen({Key? key}) : super(key: key);

  @override
  State<TransactionOverviewScreen> createState() =>
      _TransactionOverviewScreenState();
}

class _TransactionOverviewScreenState extends State<TransactionOverviewScreen> {
  final GetTransactionBridge _bridge = Modular.get<GetTransactionBridge>();
  final TransactionController _controller =
      Modular.get<TransactionController>();
  final ProcessingRepository _processing = Modular.get<ProcessingRepository>();

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
        initialIndex: _processing.isNotEmpty ? dates.length : dates.length-1,
        length: _processing.isNotEmpty ? dates.length+1 : dates.length,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            toolbarHeight: 80.h,
            title: TransactionsHeaderWidget(),
            bottom: TabBar(
              isScrollable: true,
              tabs: _getTabBarElements(dates)
            ),
          ),
          body: TabBarView(
            children: _getTabBarViewElements(dates)
          ),
        ),
      );
    });
  }

  List<Widget> _getTabBarElements(List<DateTime> dates) {
    List<Widget> tabs = dates.map<Widget>((date) {
      return TabBarItem(date: date);
    }).toList();
    if(_processing.isNotEmpty) {
      tabs.add(Tab(child: Icon(Icons.access_time),),);
    }
    return tabs;
  }

  List<Widget> _getTabBarViewElements(List<DateTime> dates) {
    List<Widget> tabViews = dates.map<Widget>((date) {
      return TransactionsItemListWidget(date: date);
    }).toList();
    if(_processing.isNotEmpty) {
      tabViews.add(const ProcessingListScreen());
    }
    return tabViews;
  }
}
