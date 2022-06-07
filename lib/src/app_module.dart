import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/private_module.dart';
import 'package:sei_services/src/modules/public/public_module.dart';
import 'package:sei_services/src/shared/domain/guards/auth_guard.dart';


class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: PublicModule()),
    RedirectRoute('/public', to: '/'),
    ModuleRoute('/private', module: PrivateModule(),)
  ];
}