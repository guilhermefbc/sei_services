import 'dart:async';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/shared/domain/bridges/get_transaction_bridge.dart';
import 'package:sei_services/src/shared/domain/constants/screen_dimension_constant.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GetTransactionBridge _bridge = Modular.get<GetTransactionBridge>();
  final ProcessingRepository _processing = Modular.get<ProcessingRepository>();
  final TransactionsRepository _transactions =
  Modular.get<TransactionsRepository>();
  late StreamSubscription _fetchTransactionsStream;

  @override
  void initState() {
    super.initState();
    Modular.to.navigate('/private/transaction/');
    _init();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _fetchTransactionsStream.cancel();
  }

  _init() async {
    _transactions.getTransactions();
    _bridge.fetchTransactions();
    _fetchTransactionsStream = Stream.periodic(const Duration(seconds: 60),).listen((_) {
      if(_processing.isNotEmpty) {
        _bridge.fetchTransactions();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(
        ScreenDimensionConstant.pixelXLWidth,
        ScreenDimensionConstant.pixelXLHeight)
    );

    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.home,),
          TabItem(icon: Icons.add_chart,),
          TabItem(icon: Icons.camera_alt,),
          TabItem(icon: Icons.add_shopping_cart,),
          TabItem(icon: Icons.people,),
        ],
        initialActiveIndex: 0,
        onTap: (int index) {
          switch(index) {
            case 0: Modular.to.navigate('/private/transaction/'); break;
            case 1: break;
            case 2: Modular.to.navigate('/private/scanner/'); break;
            case 3: break;
            case 4: Modular.to.navigate('/private/account/'); break;
          }
        },
      ),
      body: const RouterOutlet(),
    );
  }
}