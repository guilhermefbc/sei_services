import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';
import 'package:sei_services/src/shared/domain/entities/auth_entity.dart';

class AuthRepository {
  final AuthSecurityDB _authSecurityDB;
  late final AuthEntity _auth;
  AuthRepository(this._authSecurityDB){
    _init();
  }

  _init() async {
    _auth = await _authSecurityDB.readValue(key: 'token369');
  }

  AuthEntity get auth => _auth;
  String get token =>_auth.token;
}