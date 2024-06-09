import 'package:flutter/material.dart';

class ABPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        leading: new Icon(
          Icons.home,
          color: Colors.white,
        ),
        title: new Text(
          "Flutter 101",
          style: new TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
