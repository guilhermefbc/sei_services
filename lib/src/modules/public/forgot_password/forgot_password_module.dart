import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/forgot_password/presentation/screens/forgot_password_screen.dart';

class ForgotPasswordModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ForgotPasswordScreen()),
  ];
}