import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/notification_model.dart';
import '../storage/notification_storage.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<AppNotification>> _notifications;

  @override
  void initState() {
    super.initState();
    _notifications = NotificationStorage.getNotifications(); // now async Future
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Notifications"),
          centerTitle: false,
          backgroundColor: Colors.red
      ),
      body: FutureBuilder<List<AppNotification>>(
        future: _notifications,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No notifications yet"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final n = snapshot.data![index];
              return ListTile(
                title: Text(n.title),
                subtitle: Text(n.body),
                trailing: Text(n.timestamp),
              );
            },
          );
        },
      ),
    );
  }
}
