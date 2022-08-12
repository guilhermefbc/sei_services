import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:sei_services/src/modules/public/login/data/datasources/remote/login_service.dart';
import 'package:sei_services/src/modules/public/login/presentation/controller/login/login_controller.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';

class LoginUsecase {
  final LoginService _service;
  final AuthSecurityDB _auth;
  final LoginController _controller;
  LoginUsecase(this._service, this._auth, this._controller);

  Future<void> login(String email, String password) async {
    try{
      _controller.loading = true;
      Map result = await _service.login(email, password);
      _saveUserToken(result['token']);
      _loginResultAction();
    }catch(e){
      _controller.loading = false;
      throw Exception(e);
    }
  }

  _loginResultAction() {
    Modular.to.navigate('/private');
  }
  
  _saveUserToken(String token) {
    _auth.writeValue(key: dotenv.env['AUTH_KEY']!, value: token);
  }
}