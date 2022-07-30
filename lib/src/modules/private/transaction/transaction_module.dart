import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/product/product_module.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/screens/transaction_overview_screen.dart';
import 'package:sei_services/src/shared/data/datasources/local/product_db.dart';
import 'package:sei_services/src/shared/data/datasources/local/transaction_db.dart';
import 'package:sei_services/src/shared/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/domain/bridges/get_transaction_bridge.dart';
import 'package:sei_services/src/shared/domain/repositories/products_repository.dart';
import 'package:sei_services/src/shared/domain/repositories/transactions_repository.dart';


class TransactionModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => TransactionService(i(),i())),
    Bind.singleton((i) => TransactionDB()),
    Bind.singleton((i) => ProductsDB()),
    Bind.singleton((i) => TransactionsRepository(i(),)),
    Bind.singleton((i) => ProductsRepository(i())),
    Bind.singleton((i) => GetTransactionBridge(i(),i(),i(),)),
    Bind.singleton((i) => TransactionController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const TransactionOverviewScreen()),
    ModuleRoute('/product', module: ProductModule()),
  ];
}