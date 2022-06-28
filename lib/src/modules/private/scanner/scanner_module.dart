import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/screens/scanner_screen.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/screens/transaction_overview_screen.dart';


class ScannerModule extends Module {
  @override
  List<Bind> get binds => [
    // Bind.lazySingleton((i) => LogOutUsecase(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ScannerScreen()),
  ];
}