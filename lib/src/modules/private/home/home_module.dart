import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/home/presentation/screen/home_screen.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const HomeScreen()),
  ];
}