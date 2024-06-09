import 'package:flutter/material.dart';

class CPDPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Card & Parsing Data",
              style: new TextStyle(color: Colors.white)),
          backgroundColor: Colors.blue,
        ),
        body: new Container(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            new CardList(icon:Icons.home, text:"Home", iconColor:Colors.black),
            new CardList(icon:Icons.favorite, text:"Favorite", iconColor:Colors.pink),
          ],
        )));
  }
}

class CardList extends StatelessWidget {

  CardList ({required this.icon, required this.text, required this.iconColor});

  final IconData icon;
  final String text;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(12.0),
      child: new Card(
        child: new Column(
          children: [new Icon(icon, color: iconColor, size: 50.0,), 
          new Text(text, style: new TextStyle(fontSize: 20.0),)],
        ),
      ),
    );
  }
}
