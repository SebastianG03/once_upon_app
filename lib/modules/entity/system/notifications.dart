class Notifications {
  bool allowNotifications = true;
  //Time in 24h format
  int notificationHours = 8;
  int notificationMinutes = 0;

  Notifications();

  Notifications.fromJson(Map<String, dynamic> json)
      : allowNotifications = json['allowNotifications'],
        notificationHours = json['notificationHours'],
        notificationMinutes = json['notificationMinutes'];

  Map<String, dynamic> toJson() => {
    'allowNotifications': allowNotifications,
    'notificationHours': notificationHours,
    'notificationMinutes': notificationMinutes
  };

}