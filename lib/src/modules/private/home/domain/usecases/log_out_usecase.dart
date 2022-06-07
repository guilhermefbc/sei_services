import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';

class LogOutUsecase {
  final AuthSecurityDB _auth;

  LogOutUsecase(this._auth);

  Future<void> logOut() async {
    bool result = await _auth.deleteAll();
    _logOutResultAction(result);
  }

  _logOutResultAction(bool result) {
    if(result) {
      Modular.to.navigate('/login');
    }
  }
}