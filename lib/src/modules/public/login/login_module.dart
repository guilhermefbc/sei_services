import 'package:flutter_modular/flutter_modular.dart';
import 'presentation/controller/login/login_controller.dart';
import 'presentation/screen/login_screen.dart';


class LoginModule extends Module {
  @override
  // TODO: implement binds
  List<Bind<Object>> get binds => [
    Bind.lazySingleton((i) => LoginController())
  ];

  @override
  // TODO: implement routes
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginScreen()),
  ];
}