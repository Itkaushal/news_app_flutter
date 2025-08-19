import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/notification_model.dart';

class NotificationStorage {
  static const String _key = "notifications";

  /// Save notification
  static Future<void> saveNotification(AppNotification notification) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> notifications =
        prefs.getStringList(_key) ?? [];

    notifications.add(jsonEncode(notification.toJson()));
    await prefs.setStringList(_key, notifications);
  }

  /// Load notifications asynchronously
  static Future<List<AppNotification>> getNotifications() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> notifications =
        prefs.getStringList(_key) ?? [];

    return notifications
        .map((n) => AppNotification.fromJson(jsonDecode(n)))
        .toList();
  }
}


