import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sei_services/src/shared/data/models/auth_model.dart';

class AuthSecurityDB {
  final storage = const FlutterSecureStorage();

  Future<void> writeValue({required String key, required String value}) async {
    try{
      await storage.write(key: key, value: value);
    }catch(e) {
      throw Exception(e);
    }
  }

  Future<AuthModel> readValue({required String key}) async {
    try{
      String result = await storage.read(key: key) ?? '';
      return AuthModel(result);
    }catch(e) {
      throw Exception();
    }
  }

  Future<bool> deleteAll() async {
    try{
      await storage.deleteAll();
      return true;
    }catch(_) {
      return false;
    }
  }
}