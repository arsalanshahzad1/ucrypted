import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ucrypted_app/models/login_response_model.dart';

class LocalStorage {
  static const _keyToken = 'access_token';
  static const _keyUser = 'user_data';

  /// Save login response
  Future<void> saveLoginData(Map<String, dynamic> data) async {
    final prefs = await SharedPreferences.getInstance();
    final token = data['access_token'];
    final user = data['user'];

    await prefs.setString(_keyToken, token ?? '');
    await prefs.setString(_keyUser, jsonEncode(user));
  }

  /// Get access token
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  /// Get user data as Map
  Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_keyUser);
    if (jsonString == null) return null;
    return jsonDecode(jsonString);
  }

  /// Clear all login data
  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyToken);
    await prefs.remove(_keyUser);
  }

  /// Check if user is logged in
  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> saveUserModel(LoginResponseModel model) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_model', jsonEncode(model.toJson()));
  }
}
