// import 'package:shared_preferences/shared_preferences.dart';
//
// class SharedPrefsHelper {
//   static const String _userIdKey = 'user_id';
//
//   // Save User ID
//   static Future<void> saveUserId(String userId) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString(_userIdKey, userId);
//   }
//
//   // Get User ID
//   static Future<String?> getUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString(_userIdKey);
//   }
//
//   // Remove User ID (Logout)
//   static Future<void> clearUserId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(_userIdKey);
//   }
// }
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static const String _userIdKey = 'user_id';
  static const String _authTokenKey = "auth_token";

  // Save User ID (Convert int to String)
  static Future<void> saveUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userIdKey, userId.toString()); // Convert int to String
  }

  // Get User ID (Convert String to int)
  static Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userIdString = prefs.getString(_userIdKey);
    return userIdString != null ? int.tryParse(userIdString) : null; // Convert String to int
  }

  // Remove User ID
  static Future<void> clearUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userIdKey);
  }

  static Future<void> saveAuthToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_authTokenKey, token.toString()); // Convert int to String
  }

  // Get User ID (Convert String to int)
  static Future<String?> getAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenString = prefs.getString(_authTokenKey);
    return tokenString != null ? tokenString : null; // Convert String to int
  }

  // Remove User ID
  static Future<void> clearAuthToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_authTokenKey);
  }
}
