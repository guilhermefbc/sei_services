import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sei_services/src/core/domain/constants/url_const.dart';

class RegisterService {
  Future<int> createUser({
    required String email,
    required String password,
    required String firstname,
    required String lastName,
    required String nickname,
  }) async {
    try{
      Uri uri = Uri.parse("https://dev.api.sei-imposto.com/taxes/users");

      Map<String,String> body = {
        "email": email,
        "password": password,
        "token": '',
        "groupName": firstname,
        "state": '',
        "city": '',
        "zipPostCode": '',
        "country": "Brasil",
        "district": '',
        "firstName": firstname,
        "lastName": lastName
      };

      var response = await http.post(uri, body: body);
      if (response.statusCode != 200 && response.statusCode != 201) {
        throw HttpException('Falha ao se cadastrar');
      }
      // result has to be 200
      return response.statusCode;
    }catch(e){
      throw Exception(e);
    }
  }
}