import 'package:badges/badges.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/processing/presentation/controller/processing/processing_controller.dart';
import 'package:sei_services/src/modules/private/processing/presentation/screens/processing_list_screen.dart';
import 'package:sei_services/src/modules/private/processing/presentation/widgets/processing_header_widget.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/items/tab_bar_item.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/lists/transactions_item_list_widget.dart';
import 'package:sei_services/src/shared/presentation/widgets/default_header_widget.dart';
import 'package:sei_services/src/modules/private/transaction/domain/repositories/transactions_repository.dart';

class TransactionOverviewScreen extends StatefulWidget {
  const TransactionOverviewScreen({Key? key}) : super(key: key);

  @override
  State<TransactionOverviewScreen> createState() =>
      _TransactionOverviewScreenState();
}

class _TransactionOverviewScreenState extends State<TransactionOverviewScreen> {
  final TransactionController _tController =
      Modular.get<TransactionController>();
  final TransactionsRepository _tRepository =
  Modular.get<TransactionsRepository>();
  final ProcessingRepository _pRepository = Modular.get<ProcessingRepository>();
  final ProcessingController _pController =
  Modular.get<ProcessingController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      _tController.addTransactions(_tRepository.transactions);
      _pController.addAllProcessing(_pRepository.processing);
      List<DateTime> dates = _tController.transactionsDates;
      int initialIndex =
      _pController.processing.isNotEmpty ? dates.length : dates.length - 1;
      int length = _pController.processing.isNotEmpty ? dates.length + 1 : dates.length;
      return DefaultTabController(
        key: ValueKey(dates.toString()),
        initialIndex: initialIndex,
        length: length,
        child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            toolbarHeight: 80.h,
            title:
                _tController.tabIndex == initialIndex
                    && _pController.processing.isNotEmpty
                    ? const ProcessingHeaderWidget()
                    : DefaultHeaderWidget(
                        amount: _tController.filteredTransactionsTotal,
                        taxes: _tController.filteredTransactionsTaxesTotal,
                      ),
            bottom: TabBar(isScrollable: true, tabs: _getTabBarElements(dates)),
          ),
          body: TabBarView(children: _getTabBarViewElements(dates)),
        ),
      );
    });
  }

  List<Widget> _getTabBarElements(List<DateTime> dates) {
    List<Widget> tabs = dates.map<Widget>((date) {
      return TabBarItem(key: ValueKey(date.toString() + 'Tab'), date: date);
    }).toList();
    if (_pRepository.isNotEmpty) {
      tabs.add(
        Tab(
          key: ValueKey(dates.toString() + 'Tab'),
          child: Badge(
              badgeContent: Text('${_pController.processing.length}',
                style: const TextStyle(fontSize: 11),
              ),
              child: const Icon(Icons.access_time),
          ),
        ),
      );
    }
    return tabs;
  }

  List<Widget> _getTabBarViewElements(List<DateTime> dates) {
    int idx = 0;
    List<Widget> tabViews = dates.map<Widget>((date) {
      return TransactionsItemListWidget(
        key: ValueKey(date.toString() + 'TabView'),
        date: date,
        index: idx++,
      );
    }).toList();
    if (_pRepository.isNotEmpty) {
      tabViews.add(ProcessingListScreen(
        key: ValueKey(dates.toString() + 'TabView'),
        index: idx,
      ));
    }
    return tabViews;
  }
}
