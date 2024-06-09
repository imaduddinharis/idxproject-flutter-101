import 'package:flutter/material.dart';

class NPageOne extends StatelessWidget{
  @override Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page One", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(Icons.headset, size: 50.0),
          onPressed: (){
            Navigator.pushNamed(context, '/pageTwo');
          },
        )
      )
    );
  }
}

class NPageTwo extends StatelessWidget{
  @override Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Page Two", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: new Center(
        child: new IconButton(
          icon: new Icon(Icons.speaker, size: 50.0),
          onPressed: (){
            Navigator.pushNamed(context, '/pageOne');
          },
        )
      )
    );
  }
}