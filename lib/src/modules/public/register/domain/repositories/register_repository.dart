import 'package:sei_services/src/modules/public/register/data/datasources/remote/register_service.dart';

class RegisterRepository {
  final RegisterService service;
  RegisterRepository(this.service);

  Future<bool> createUser({
    required String email,
    required String password,
    required String firstname,
    required String lastName,
    required String nickname,
  }) async {
    try {
      int result = await service.createUser(
          email: email,
          password: password,
          firstname: firstname,
          lastName: lastName,
          nickname: nickname
      );

      return result == 200 || result == 201;
    }catch(e) {
      return false;
    }
  }
}