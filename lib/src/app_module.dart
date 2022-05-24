import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/private_module.dart';
import 'package:sei_services/src/modules/public/public_module.dart';
import 'modules/public/login/login_module.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: PublicModule()),
    ModuleRoute('/private', module: PrivateModule())
  ];
}