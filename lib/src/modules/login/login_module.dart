import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/login/presentation/controller/login/login_controller.dart';
import 'package:sei_services/src/modules/login/presentation/screen/login_screen.dart';

class LoginModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => LoginController())
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginScreen()),
  ];
}