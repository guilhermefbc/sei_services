import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/login/login_module.dart';
import 'package:sei_services/src/modules/public/splash/splash_module.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';
import 'package:sei_services/src/shared/domain/usecases/is_logged_usecase.dart';


class PublicModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => AuthSecurityDB()),
    Bind.lazySingleton((i) => IsLoggedUsecase(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: SplashModule()),
    RedirectRoute('/splash', to: '/'),
    ModuleRoute('/login', module: LoginModule()),
  ];
}