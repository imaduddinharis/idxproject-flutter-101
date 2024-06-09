import 'package:flutter/material.dart';

class LRCPageOne extends StatelessWidget {
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
        actions: <Widget>[
          new Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new Icon(Icons.android, size: 70.0, color: Colors.blue),
            new Row(
              children: <Widget>[
            new Icon(Icons.language, size: 70.0, color: Colors.blue),
            new Icon(Icons.language, size: 70.0, color: Colors.blue),
            new Icon(Icons.language, size: 70.0, color: Colors.blue),
              ],
            ),
            new Icon(Icons.account_circle, size: 70.0, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
