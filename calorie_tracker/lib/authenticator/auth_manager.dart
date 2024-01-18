import 'package:shared_preferences/shared_preferences.dart';
import 'package:calorie_tracker/utils/generate_rowid.dart';
import 'package:calorie_tracker/store/manage_state.dart';

class AuthManager {
  static const String _tokenKey = 'user_token';
  static const String _lastLoginKey = 'last_login';
  static const String _idUserKey = 'user_id';

  static Future<void> login(String rowid) async {
    GenerateRowid id = GenerateRowid();
    await _saveToken(id.generate());
    await _saveLastLogin(DateTime.now());
    await _saveUserId(rowid);
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

  static Future<void> _saveUserId(String rowid) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_idUserKey, rowid);
  }

  static Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_idUserKey);
  }

  static Future<bool> isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_lastLoginKey);
    final token = await getToken();
    final lastLogin = await getLastLogin();
    final rowid = await getUserId();


    if (token != null && lastLogin != null) {
      final now = DateTime.now();
      final thirtyDaysAgo = now.subtract(Duration(days: 30));
      ManageState().setUserData(rowid!);
      // Verifica se a última autenticação foi feita há mais de 30 dias
      return !lastLogin.isBefore(thirtyDaysAgo);
    }

    return false;
  }
}
