import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/account/presentation/screens/account_screen.dart';
import 'package:sei_services/src/modules/private/home/domain/usecases/log_out_usecase.dart';


class AccountModel extends Module {
  @override
  List<Bind> get binds => [
    Bind.lazySingleton((i) => LogOutUsecase(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const AccountScreen()),
  ];
}