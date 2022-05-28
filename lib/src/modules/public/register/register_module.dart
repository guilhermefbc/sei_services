import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/screens/register_screen.dart';


class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => RegisterController())
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const RegisterScreen()),
  ];
}