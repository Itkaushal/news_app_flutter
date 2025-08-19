import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadArticalScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Daily Khabar"),
      ),
      body: Center(
        child: Container(
          child: Center(child: Text("this is akhabar reading screen")),
        ),
      ),
    );
  }
}