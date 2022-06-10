import 'package:sei_services/src/modules/public/forgot_password/data/datasources/remote/forgot_password_service.dart';

class ForgotPasswordUsecase {
  final ForgotPasswordService _service;
  
  ForgotPasswordUsecase(this._service);
  
  Future<bool> resetPassword({required String email}) async {
    try{
      int result =  await _service.resetPassword(email: email);
      return result == 200;
    }catch(_){
      return false;
    }
  }
}