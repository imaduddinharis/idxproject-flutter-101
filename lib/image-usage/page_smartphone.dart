import 'package:flutter/material.dart';

class SmartPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: [
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("SmartPhone", style: new TextStyle(fontSize: 30.0)),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Image(image: new NetworkImage("https://www.freepnglogos.com/uploads/smartphone-png/smartphone-top-mobile-phone-companies-the-world-ibs-minds-38.png"), width: 300.0,)
          ],
        ),
      ),
    );
  }
}
