import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/core/connectivity/connection.dart';
import 'package:sei_services/src/modules/private/home/home_module.dart';
import 'package:sei_services/src/modules/private/processing/data/datasources/local/processing_db.dart';
import 'package:sei_services/src/modules/private/processing/domain/repositories/processing_repository.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';
import 'package:sei_services/src/shared/domain/guards/auth_guard.dart';
import 'package:sei_services/src/shared/domain/repositories/auth_repository.dart';
import 'package:sei_services/src/shared/domain/usecases/is_logged_usecase.dart';
import 'package:uuid/uuid.dart';


class PrivateModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AuthSecurityDB()),
    Bind.singleton((i) => ProcessingDB()),
    Bind.singleton((i) => AuthRepository(i())),
    Bind.singleton((i) => const Uuid()),
    Bind.singleton((i) => Connection()),
    Bind.singleton((i) => ProcessingRepository(i())),
    Bind.singleton((i) => IsLoggedUsecase(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule(), guards: [AuthGuard()])
  ];
}