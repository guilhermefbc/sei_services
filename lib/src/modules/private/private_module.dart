import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/home/home_module.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';
import 'package:sei_services/src/shared/domain/guards/auth_guard.dart';
import 'package:sei_services/src/shared/domain/repositories/auth_repository.dart';
import 'package:sei_services/src/shared/domain/usecases/is_logged_usecase.dart';


class PrivateModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AuthSecurityDB()),
    Bind.singleton((i) => AuthRepository(i())),
    Bind.lazySingleton((i) => IsLoggedUsecase(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule(), guards: [AuthGuard()])
  ];
}