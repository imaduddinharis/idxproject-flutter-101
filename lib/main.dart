import 'package:flutter/material.dart';
// import 'package:myapp/helloworld/main.dart';
// import 'package:myapp/style-text-icon/main.dart';
// import 'package:myapp/appbar/main.dart';
// import 'package:myapp/layout-row-column/main.dart';
// import 'package:myapp/card-parsing-data/main.dart';
// import 'package:myapp/navigation/main.dart';
// import 'package:myapp/tabbar/main.dart';
// import 'package:myapp/image-usage/main.dart';
import 'package:myapp/listview/main.dart';

void main() {
  runApp(new MaterialApp(
    
    title: "Flutter 101",
    home: new LVHome(),

    // routes: <String, WidgetBuilder>{
    //   'pageOne': (BuildContext context) => new NPageOne(),
    //   'pageTwo': (BuildContext context) => new NPageTwo(),
    // },
  ));
}
