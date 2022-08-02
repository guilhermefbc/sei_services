import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/account/account_model.dart';
import 'package:sei_services/src/modules/private/home/presentation/screen/home_screen.dart';
import 'package:sei_services/src/modules/private/scanner/scanner_module.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/controllers/transaction/transaction_controller.dart';
import 'package:sei_services/src/modules/private/transaction/transaction_module.dart';
import 'package:sei_services/src/shared/data/datasources/local/product_db.dart';
import 'package:sei_services/src/modules/private/transaction/data/datasources/local/transaction_db.dart';
import 'package:sei_services/src/modules/private/transaction/data/datasources/remote/transaction_service.dart';
import 'package:sei_services/src/shared/domain/bridges/get_transaction_bridge.dart';
import 'package:sei_services/src/shared/domain/repositories/products_repository.dart';
import 'package:sei_services/src/modules/private/transaction/domain/repositories/transactions_repository.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => TransactionService(i(),i())),
    Bind.singleton((i) => TransactionDB()),
    Bind.singleton((i) => ProductsDB()),
    Bind.singleton((i) => TransactionsRepository(i(),)),
    Bind.singleton((i) => TransactionController()),
    Bind.singleton((i) => ProductsRepository(i())),
    Bind.singleton((i) => GetTransactionBridge(i(),i(),i(),i(),i(),i(),)),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomeScreen(), children: [
      ModuleRoute('/transaction', module: TransactionModule()),
      ModuleRoute('/account', module: AccountModel()),
      ModuleRoute('/scanner', module: ScannerModule())
      // ModuleRoute('/', module: TransactionModule())
    ]),
  ];
}