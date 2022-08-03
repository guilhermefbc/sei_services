import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/scanner/data/datasources/remote/scanner_service.dart';
import 'package:sei_services/src/modules/private/scanner/domain/util/scanner_util.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/controller/scanner_controller.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/screens/numeric_code_screen.dart';
import 'package:sei_services/src/modules/private/scanner/presentation/screens/scanner_screen.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/screens/transaction_overview_screen.dart';


class ScannerModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ScannerController()),
    Bind.singleton((i) => ScannerService(i())),
    Bind.singleton((i) => ScannerUtil(i(),i(),i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ScannerScreen()),
    ChildRoute('/manual_numeric_code', child: (context, args) => const NumericCodeScreen()),
  ];
}