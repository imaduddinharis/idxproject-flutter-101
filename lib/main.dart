import 'package:flutter/material.dart';
// import 'package:myapp/helloworld/main.dart';
// import 'package:myapp/style-text-icon/main.dart';
// import 'package:myapp/appbar/main.dart';
// import 'package:myapp/layout-row-column/main.dart';
// import 'package:myapp/card-parsing-data/main.dart';
// import 'package:myapp/navigation/main.dart';
// import 'package:myapp/tabbar/main.dart';
// import 'package:myapp/image-usage/main.dart';
// import 'package:myapp/listview/main.dart';
// import 'package:myapp/listview-json/main.dart';
// import 'package:myapp/input-alert-snackbar/main.dart';
// import 'package:myapp/drawer/main.dart';
// import 'package:myapp/gridview-hero-ui/main.dart';
// import 'package:myapp/gradient-pageview-hero-menu-dropdown/main.dart';
// import 'package:myapp/form/main.dart';
import 'package:myapp/firebase-auth/main.dart';
void main() {
  
  runApp(MaterialApp(
    title: "Flutter 101",
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.grey,
        toolbarTextStyle: TextStyle(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    ),
    home: const FALogin(),

    // routes: <String, WidgetBuilder>{
    //   'pageOne': (BuildContext context) => new NPageOne(),
    //   'pageTwo': (BuildContext context) => new NPageTwo(),
    // },
  ));
}
