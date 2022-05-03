import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/login/login_module.dart';
import 'package:sei_services/src/modules/login/presentation/screen/login_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: LoginModule())
  ];
}