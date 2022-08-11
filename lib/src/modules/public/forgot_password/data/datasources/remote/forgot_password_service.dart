import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class ForgotPasswordService {
  Future<int> resetPassword({required String email}) async {
    try{
      Uri uri = Uri.parse("${dotenv.env['URL']}/taxes/users/resetpassword");
      final response = await http.post(uri, body: {"email": email});
      return response.statusCode;
    }catch(e) {
      throw Exception(e);
    }
  }
}