import 'package:flutter/material.dart';

class Headset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: [
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("Headset", style: new TextStyle(fontSize: 30.0)),
            new Padding(padding: new EdgeInsets.all(20.0),),
            Image.asset("img/headset-1.jpg", width: 300.0,)
          ],
        ),
      ),
    );
  }
}
