import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:sei_services/src/shared/domain/repositories/auth_repository.dart';

class ScannerService {
  final AuthRepository _auth;
  ScannerService(this._auth);

  Future<int> postQRBill(String code) async {
    final Uri uri = Uri.parse("${dotenv.env['URL']}/nw/nfces");
    final body = json.encode({
      "code": code,
      "groupId": 1,
      "accountNumber": 1,
      "isStockable": 1,
    });

    print(body.toString());

    final response = await http.post(uri,
        body: body,
        headers: {'Content-Type': 'application/json', dotenv.env['HTTP_KEY']!: _auth.token}
    );

    if (response.statusCode != 200 && response.statusCode != 202 && response.statusCode != 409) {
      throw HttpException('Falha na requisição');
    }

    return response.statusCode;
  }
}