import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/manual/presentation/screens/manual_screens.dart';

class ManualModule extends Module {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ManualScreens()),
  ];
}