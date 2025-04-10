import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

 static void setData(String key, dynamic value) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else {
      await sharedPreferences.setDouble(key, value);
    }
  }

 static void setList(String key, List<String> value) async {
    await sharedPreferences.setStringList(key, value);
  }


  static List<String> getList(String key) {
    return sharedPreferences.getStringList(key)??[];
  }
}

class CacheKeys {
  static const String favorites = 'favorites';
}
