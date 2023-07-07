
import 'package:shared_preferences/shared_preferences.dart';

class AppPersistentStore {
  static Future<SharedPreferences> initialize() async => _sharedPreferences = await SharedPreferences.getInstance();

  static const String _key = 'id';
  static late SharedPreferences _sharedPreferences;

  static Future<bool> setUserId(String id) async {
    return await _sharedPreferences.setString(_key, id);
  }

  static String? getUserId() {
    return _sharedPreferences.getString(_key);
  }

  static Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
