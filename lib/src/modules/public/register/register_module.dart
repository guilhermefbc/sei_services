import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/register/data/datasources/remote/register_service.dart';
import 'package:sei_services/src/modules/public/register/domain/repositories/register_repository.dart';
import 'package:sei_services/src/modules/public/register/presentation/controllers/register/register_controller.dart';
import 'package:sei_services/src/modules/public/register/presentation/screens/register_screen.dart';


class RegisterModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => RegisterController()),
    Bind.lazySingleton((i) => RegisterService()),
    Bind.lazySingleton((i) => RegisterRepository(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const RegisterScreen()),
  ];
}