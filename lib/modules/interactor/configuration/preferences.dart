import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  final String _notificationPreferences = "allowNotifications";
  late final SharedPreferences _instance;
  final String _appTheme = "appTheme";
  final String _userId = "userId";

  Preferences() {
    setInstance();
  }

  SharedPreferences get instance => _instance;
  void setInstance() async => _instance = await SharedPreferences.getInstance();

  Future<bool> getAllowNotifications() async => _instance.getBool(_notificationPreferences) ?? false;
  Future<bool> setAllowNotifications(bool value) async => _instance.setBool(_notificationPreferences, value);

  Future<int> getAppTheme() async => _instance.getInt(_appTheme) ?? 0;
  Future<bool> setAppTheme(int theme) async => _instance.setInt(_appTheme, theme);

  Future<String> getUserId() async => _instance.getString(_userId) ?? "";
  Future<bool> setUserId(String userId) async => _instance.setString(_userId, userId);

}