import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/home/home_module.dart';


class PrivateModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule())
  ];
}