import 'package:flutter/material.dart';

class STIPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new Center(
            child: new Container(
                color: Colors.blue,
                width: 200.0,
                height: 100.0,
                child: new Center(
                    child: new Column(
                  children: [
                    new Text("Flutter 101",
                        style: new TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "Serif")),
                    new Icon(Icons.android, color: Colors.white, size: 70.0)
                  ],
                )))));
  }
}
