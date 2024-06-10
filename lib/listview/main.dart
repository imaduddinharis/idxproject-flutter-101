import 'package:flutter/material.dart';

class LVHome extends StatelessWidget {
  final String defaultIcon =
      "https://static-00.iconduck.com/assets.00/flutter-icon-2048x2048-ufx4idi8.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            "Flutter 101",
            style: new TextStyle(color: Colors.white),
          ),
        ),
        body: new ListView(
          children: <Widget>[
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
            new ListJourney(image: defaultIcon, title: "Intro", description:"Pengenalan Flutter"),
          ],
        ));
  }
}

class ListJourney extends StatelessWidget {
  const ListJourney({required this.image, required this.title, required this.description});

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(20.0),
      child: new Row(
        children: [
          new Image(
            image: new NetworkImage(image),
            width: 50.0,
          ),
          new Padding(padding: new EdgeInsets.all(12.0)),
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new Text(
                title,
                style: new TextStyle(fontSize: 20.0, ),
              ),
              new Text(
                description,
                style: new TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
