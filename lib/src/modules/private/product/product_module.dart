import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/product/presentation/screens/product_overview_screen.dart';



class ProductModule extends Module {
  @override
  List<Bind> get binds => [

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ProductOverviewScreen()),
  ];
}