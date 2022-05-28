import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/login/login_module.dart';


class PublicModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: LoginModule()),
  ];
}