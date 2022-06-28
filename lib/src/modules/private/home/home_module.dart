import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/account/account_model.dart';
import 'package:sei_services/src/modules/private/home/domain/usecases/log_out_usecase.dart';
import 'package:sei_services/src/modules/private/home/presentation/screen/home_screen.dart';
import 'package:sei_services/src/modules/private/scanner/scanner_module.dart';
import 'package:sei_services/src/modules/private/transaction/transaction_module.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [
    // Bind.lazySingleton((i) => LogOutUsecase(i())),
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