import 'package:exam_app/config/di/di.dart';
import 'package:exam_app/core/values/secure_storage_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SecureStorageService {
  static final storage = getIt<FlutterSecureStorage>();

  static Future<String?> get token => readToken();

  static Future<void> writeToken(String? token) async {
    await storage.write(key: SecureStorageKeys.token, value: token);
  }

  static Future<String?> readToken() async {
    return await storage.read(key: SecureStorageKeys.token);
  }

  Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email') ?? '',
      'password': prefs.getString('password') ?? '',
    };

  }
  Future<void> saveUserData(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }

}
