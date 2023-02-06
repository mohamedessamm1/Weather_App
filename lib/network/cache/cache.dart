import 'package:shared_preferences/shared_preferences.dart';

class cachehelper {
  static SharedPreferences? sharedPreferences;
  static initcache() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<dynamic> setdata({
    required key,
    required value,
  }) {
    return sharedPreferences!.setString(key, value);
  }

  static  getdata({
    required key,
  }) {
    sharedPreferences!.getString(key);
  }
}
