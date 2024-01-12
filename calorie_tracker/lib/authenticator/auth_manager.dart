import 'package:shared_preferences/shared_preferences.dart';
import 'package:calorie_tracker/utils/generate_rowid.dart';

class AuthManager {
  static const String _tokenKey = 'user_token';
  static const String _lastLoginKey = 'last_login';

  static Future<void> login() async {
    GenerateRowid id = GenerateRowid();
    await _saveToken(id.generate());
    await _saveLastLogin(DateTime.now());
  }

  static Future<void> _saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> _saveLastLogin(DateTime dateTime) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_lastLoginKey, dateTime.millisecondsSinceEpoch);
  }

  static Future<DateTime?> getLastLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final lastLoginMillis = prefs.getInt(_lastLoginKey);
    return lastLoginMillis != null
        ? DateTime.fromMillisecondsSinceEpoch(lastLoginMillis)
        : null;
  }

  static Future<bool> isLoggedIn() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove(_lastLoginKey);
    final token = await getToken();
    final lastLogin = await getLastLogin();

    if (token != null && lastLogin != null) {
      final now = DateTime.now();
      final thirtyDaysAgo = now.subtract(Duration(days: 30));

      // Verifica se a última autenticação foi feita há mais de 30 dias
      return !lastLogin.isBefore(thirtyDaysAgo);
    }

    return false;
  }
}
