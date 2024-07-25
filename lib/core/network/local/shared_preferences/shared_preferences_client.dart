import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPreferencesClient {
  static late SharedPreferences instance;
  SharedPreferences? get sharedPreferencesInstance => instance;

  static Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }
}
