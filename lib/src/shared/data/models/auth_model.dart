import 'package:sei_services/src/shared/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  AuthModel(token) : super(token);

  factory AuthModel.fromMap(Map map) {
    return AuthModel(map['token']);
  }
}