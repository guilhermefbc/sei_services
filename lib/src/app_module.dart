import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/login/presentation/screen/login_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const LoginScreen()),
  ];
}