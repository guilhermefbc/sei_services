import 'dart:io';
import 'package:http/http.dart' as http;

class ForgotPasswordService {
  Future<int> resetPassword({required String email}) async {
    try{
      Uri uri = Uri.parse("https://dev.api.sei-imposto.com/taxes/users/resetpassword");
      final response = await http.post(uri, body: {"email": email});
      return response.statusCode;
    }catch(e) {
      throw Exception(e);
    }
  }
}