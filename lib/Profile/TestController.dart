import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userEmail") ?? "";
  }

  static Future<String> getUserDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userDisplayName") ?? "";
  }
  static Future<String> getLoginType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("loginType") ?? "";
  }
}