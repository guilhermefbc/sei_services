import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/forgot_password/data/datasources/remote/forgot_password_service.dart';
import 'package:sei_services/src/modules/public/forgot_password/domain/usecases/forgot_password_usecase.dart';
import 'package:sei_services/src/modules/public/forgot_password/presentation/screens/forgot_password_screen.dart';

class ForgotPasswordModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => ForgotPasswordService()),
    Bind.lazySingleton((i) => ForgotPasswordUsecase(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ForgotPasswordScreen()),
  ];
}