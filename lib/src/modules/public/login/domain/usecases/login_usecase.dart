import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/login/data/datasources/remote/login_service.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';

class LoginUsecase {
  final LoginService _service;
  final AuthSecurityDB _auth;
  LoginUsecase(this._service, this._auth);

  Future<void> login(String email, String password) async {
    try{
      Map result = await _service.login(email, password);
      _saveUserToken(result['token']);
      _loginResultAction();
    }catch(e){
      throw Exception(e);
    }
  }

  _loginResultAction() {
    Modular.to.navigate('/private');
  }
  
  _saveUserToken(String token) {
    _auth.writeValue(key: 'token369', value: token);
  }
}