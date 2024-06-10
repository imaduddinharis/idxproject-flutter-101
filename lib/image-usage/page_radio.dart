import 'package:flutter/material.dart';

class Radio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          children: [
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Text("Radio", style: new TextStyle(fontSize: 30.0)),
            new Padding(padding: new EdgeInsets.all(20.0),),
            new Image(image: new NetworkImage("https://www.freepnglogos.com/uploads/radio-png/subemelaradio-19.png"), width: 300.0,)
          ],
        ),
      ),
    );
  }
}
