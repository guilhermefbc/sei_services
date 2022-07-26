import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/widgets/items/transaction_item.dart';
import 'package:sei_services/src/shared/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/domain/entities/transaction_entity.dart';

class TransactionOverviewScreen extends StatefulWidget {
  const TransactionOverviewScreen({Key? key}) : super(key: key);

  @override
  State<TransactionOverviewScreen> createState() => _TransactionOverviewScreenState();
}

class _TransactionOverviewScreenState extends State<TransactionOverviewScreen> {
  final TransactionService _bridge = Modular.get<TransactionService>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(),
      body: FutureBuilder(
          future: _bridge.getTransactions(),
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
