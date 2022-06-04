import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/core/datasources/local/auth_security_db.dart';
import 'package:sei_services/src/modules/public/forgot_password/forgot_password_module.dart';
import 'package:sei_services/src/modules/public/login/data/datasources/remote/login_service.dart';
import 'package:sei_services/src/modules/public/login/domain/repositories/login_repository.dart';
import 'package:sei_services/src/modules/public/register/register_module.dart';
import 'presentation/controller/login/login_controller.dart';
import 'presentation/screen/login_screen.dart';


class LoginModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => LoginController()),
    Bind.lazySingleton((i) => LoginService()),
    Bind.lazySingleton((i) => AuthSecurityDB()),
    Bind.lazySingleton((i) => LoginRepository(i(),i()))
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginScreen()),
    ModuleRoute('/forgot_password', module: ForgotPasswordModule()),
    ModuleRoute('/register', module: RegisterModule()),
  ];
}