import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sei_services/src/shared/data/datasources/local/auth_security_db.dart';
import 'package:sei_services/src/shared/domain/entities/auth_entity.dart';

class IsLoggedUsecase {
  final AuthSecurityDB _auth;
  IsLoggedUsecase(this._auth);

  Future<bool> isLogged() async {
    AuthEntity auth = await _auth.readValue(key: dotenv.env['AUTH_KEY']!);
    return auth.isValid();
  }
}