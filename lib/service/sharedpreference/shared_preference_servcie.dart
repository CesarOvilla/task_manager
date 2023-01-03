import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static String? authorization;
  static String? tokenUser;

  static late SharedPreferences prefs;

  static Future<void> initSerivce() async {
    prefs = await SharedPreferences.getInstance();
    await _initAuthorization();
    await _initTokenUser();
  }

  static Future<void> _initAuthorization() async {
    authorization = prefs.getString("authorization");
    if (authorization == null) {
      await prefs.setString("authorization",
          "Bearer e864a0c9eda63181d7d65bc73e61e3dc6b74ef9b82f7049f1fc7d9fc8f29706025bd271d1ee1822b15d654a84e1a0997b973a46f923cc9977b3fcbb064179ecd");
      authorization = prefs.getString("authorization");
    }
  }

  static Future<void> _initTokenUser() async {
    tokenUser = prefs.getString("tokenUser");
    if (tokenUser == null) {
      await prefs.setString("tokenUser", generateRandomString(15));
      tokenUser = prefs.getString("tokenUser");
    }
  }

  static String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }
}
