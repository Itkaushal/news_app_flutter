import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.red,
      ),
      body:
        Center(
          child: Container(
            child: Text("Notification screen"),
          ),
        )
    );
  }
}
