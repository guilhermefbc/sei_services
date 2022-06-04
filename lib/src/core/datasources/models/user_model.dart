import 'package:sei_services/src/core/domain/entities/user_entity.dart';

class UserModel extends UserEntity {

  UserModel({
    firstName,
    email,
    lastName,
    nickname,
    age,
    cep}) : super(
      firstName: firstName,
      email: email,
      lastName: lastName,
      nickname: nickname,
      age: age,
      cep: cep
  );

  factory UserModel.fromMap(Map map) {
    return UserModel(
      firstName: map['firstName'],
      email: map['email'],
      lastName: map['lastName'],
      nickname: map['nickname'],
      age: map['age'],
      cep: map['cep']
    );
  }

  toMap() {
    return <String,dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'nickname': nickname,
      'age': age,
      'cep': cep
    };
  }
}