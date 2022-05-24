import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sei_services/src/core/constants/url_const.dart';

class LoginService {
  Future<Map> login(String email, String password) async {
    try{
      final response = await http.post(
          Uri(path: URLConst.URL + 'users/makeLogin'),
          body: {'email': email, 'password': password}
      );
      if(response.statusCode == 200){
        return json.decode(response.body);
      }else{
        throw const HttpException('Login Inválido!');
      }
    }catch(e) {
      throw const HttpException('Login Inválido!');
    }
  }
}