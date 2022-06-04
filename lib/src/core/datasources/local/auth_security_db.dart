import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthSecurityDB {
  final storage = const FlutterSecureStorage();

  Future<void> writeValue({required String key, required String value}) async {
    await storage.write(key: key, value: value);
  }

  Future<String> readValue({required String key}) async {
    return await storage.read(key: key) ?? '';
  }

  Future<void> deleteAll() async {
    await storage.deleteAll();
  }
}