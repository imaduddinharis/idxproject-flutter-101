import 'package:flutter/material.dart';
import 'package:myapp/tabbar/page_computer.dart' as computer;
import 'package:myapp/tabbar/page_headset.dart' as headset;
import 'package:myapp/tabbar/page_radio.dart' as radio;
import 'package:myapp/tabbar/page_smartphone.dart' as smartphone;

class TBHome extends StatefulWidget {
  @override
  _TBHomeState createState() => new _TBHomeState();
}

class _TBHomeState extends State<TBHome> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Electronic Devices",
            style: new TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        bottom: new TabBar(
          controller: tabController,
          tabs: [
            new Tab(icon: new Icon(Icons.computer)),
            new Tab(icon: new Icon(Icons.headset)),
            new Tab(icon: new Icon(Icons.radio)),
            new Tab(icon: new Icon(Icons.smartphone)),
          ],
        ),
      ),
      body: new TabBarView(controller: tabController, children: <Widget>[
        new computer.Computer(),
        new headset.Headset(),
        new radio.Radio(),
        new smartphone.SmartPhone(),
      ]),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: tabController,
          tabs: [
            new Tab(icon: new Icon(Icons.computer)),
            new Tab(icon: new Icon(Icons.headset)),
            new Tab(icon: new Icon(Icons.radio)),
            new Tab(icon: new Icon(Icons.smartphone)),
          ],
        ),
      ),
    );
  }
}
