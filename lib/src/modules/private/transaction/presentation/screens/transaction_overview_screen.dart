import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/items/transaction_item.dart';
import 'package:sei_services/src/shared/domain/bridges/get_transaction_bridge.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';

class TransactionOverviewScreen extends StatefulWidget {
  const TransactionOverviewScreen({Key? key}) : super(key: key);

  @override
  State<TransactionOverviewScreen> createState() => _TransactionOverviewScreenState();
}

class _TransactionOverviewScreenState extends State<TransactionOverviewScreen> {
  final GetTransactionBridge _bridge = Modular.get<GetTransactionBridge>();
  final TransactionsRepository _transactions = Modular.get<TransactionsRepository>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _bridge.getTransactions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(),
      body: FutureBuilder(
          future: _transactions.getTransactions(),
          builder: (ctx, snapshot) {
            if(!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(),);
            }
            List list = snapshot.data as List;
            return ListView(
              padding: const EdgeInsets.only(top: 10).r,
              children: list.map<Widget>((transaction) => TransactionItem(transaction: transaction)).toList(),
            );
          }
      ),
    );
  }
}
