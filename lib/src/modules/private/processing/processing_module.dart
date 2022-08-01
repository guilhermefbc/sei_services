import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/processing/presentation/processing_list_screen.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';


class ProcessingModule extends Module {
  @override
  List<Bind> get binds => [
    Bind.singleton((i) => AuthSecurityDB()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const ProcessingListScreen()),
  ];
}