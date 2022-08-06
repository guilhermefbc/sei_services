import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/processing/presentation/controller/processing/processing_controller.dart';
import 'package:sei_services/src/modules/private/product/product_module.dart';
import 'package:sei_services/src/modules/private/transaction/presentation/screens/transaction_overview_screen.dart';


class TransactionModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => ProcessingController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const TransactionOverviewScreen()),
    ModuleRoute('/product', module: ProductModule()),
  ];
}