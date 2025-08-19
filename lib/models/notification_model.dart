class AppNotification {
  final String title;
  final String body;
  final String timestamp;

  AppNotification({
    required this.title,
    required this.body,
    required this.timestamp,
  });

  factory AppNotification.fromJson(Map<String, dynamic> json) {
    return AppNotification(
      title: json['title'],
      body: json['body'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "body": body,
      "timestamp": timestamp,
    };
  }
}

