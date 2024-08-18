import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static SharedPreferences? prefs;

  static const keyToken = 'token';
  static const keyFirstTime = 'isFirst';

  static Future init() async => prefs = await SharedPreferences.getInstance();

  static setToken(String? token) => prefs!.setString(keyToken, token!);
  static String? getToken() => prefs!.getString(keyToken);

  static setFirstTime(bool? f) => prefs!.setBool(keyFirstTime, f!);
  static bool? getFirstTime() => prefs!.getBool(keyFirstTime);
}
