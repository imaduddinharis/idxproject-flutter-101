import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:myapp/listview-json/JSONData.dart';

class LVJHome extends StatefulWidget {
  const LVJHome({super.key});

  @override
  State<LVJHome> createState() => _LVJHomeState();
}

class _LVJHomeState extends State<LVJHome> {

  static Future<List<JSONData>> getData() async{
    var url = Uri.parse("https://jsonplaceholder.typicode.com/albums/1/photos");
    final response = await http.get(url, headers: {
      "Accept": "application/json"
    });
    final List body = json.decode(response.body);
    return body.map((e) => JSONData.fromJSON(e)).toList();
  }

  Future<List<JSONData>> dataJSON = getData();


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List View JSON"),
      ),
      body: new FutureBuilder(
        future: dataJSON, 
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else if(snapshot.hasData){
            final data = snapshot.data!;
            return buildData(data);
          }else{
            return const Text("No data available");
          }
        })
    );
  }
  Widget buildData(List<JSONData> datas) {
  return ListView.builder(
    itemCount: datas.length,
    itemBuilder: (context, index) {
      final data = datas[index];
      return Container(
        color: Colors.grey.shade300,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        height: 100,
        width: double.maxFinite,
        child: Row(
          children: [
            Expanded(flex: 1, child: Image.network(data.url!)),
            SizedBox(width: 10),
            Expanded(flex: 3, child: Text(data.title!)),
          ],
        ),
      );
    },
  );
}
  }
