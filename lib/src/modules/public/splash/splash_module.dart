

import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/splash/presentation/screens/splash_screen.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => SplashScreen(),),
    RedirectRoute('/splash', to: '/')
  ];
}