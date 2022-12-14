import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/private/home/domain/usecases/log_out_usecase.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final LogOutUsecase _logOut = Modular.get<LogOutUsecase>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () async {
            await _logOut.logOut();
          },
        ),
      ),
      body: Container(color: Colors.white,),
    );
  }
}
