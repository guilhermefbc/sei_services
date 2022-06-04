import 'package:sei_services/src/core/datasources/local/auth_security_db.dart';
import 'package:sei_services/src/modules/public/login/data/datasources/remote/login_service.dart';

class LoginRepository {
  final LoginService _service;
  final AuthSecurityDB _auth;
  LoginRepository(this._service, this._auth);

  Future<bool> login(String email, String password) async {
    try{
      Map result = await _service.login(email, password);

      return true;
    }catch(_){
      return false;
    }
  }
}