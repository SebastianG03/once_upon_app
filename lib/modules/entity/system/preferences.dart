import 'package:once_upon_app/modules/entity/system/notifications.dart';

class Preferences {
  int theme = 0;
  Notifications notifications = Notifications();

  Preferences();

  Preferences.fromJson(Map<String, dynamic> json)
      : theme = json['theme'],
        notifications = Notifications.fromJson(json['notifications']);

  Map<String, dynamic> toJson() => {
    'theme': theme,
    'notifications': notifications.toJson()
  };
}