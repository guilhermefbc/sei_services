import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sei_services/src/shared/domain/repositories/auth_repository.dart';

class ScannerService {
  final AuthRepository _auth;
  ScannerService(this._auth);

  Future<int> postQRBill(String code) async {
    final Uri uri = Uri.parse("https://dev.api.sei-imposto.com/nw/nfces");
    final body = json.encode({
      "code": '25220312919734000310651130002533851005957160',
      "groupId": 1,
      "accountNumber": 1,
      "isStockable": 1,
    });

    print(body.toString());

    final response = await http.post(uri,
        body: body,
        headers: {'Content-Type': 'application/json', 'X-HYPERMARKET': _auth.token}
    );

    if (response.statusCode != 200 && response.statusCode != 202 && response.statusCode != 409) {
      throw HttpException('Falha na requisição');
    }

    return response.statusCode;
  }
}