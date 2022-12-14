import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class LoginService {
  Future<Map> login(String email, String password) async {
    try{
      Uri uri = Uri.parse("${dotenv.env['URL']}/taxes/users/makeLogin");

      final response = await http.post(
          uri,
          body: {'email': email, 'password': password}
      );
      if(response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw const HttpException('Invalid login');
      }
    }catch(e) {
      throw const HttpException('Invalid login');
    }
  }
}