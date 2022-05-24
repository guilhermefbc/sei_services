import 'package:sei_services/src/modules/public/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity{
  LoginModel({
    required String email, 
    required String password
  }) : super(email: email, password: password);
  
  factory LoginModel.fromMap(Map map) {
    return LoginModel(
        email: map['email'],
        password: map['password']
    );
  }

  toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password
    };
  }
}