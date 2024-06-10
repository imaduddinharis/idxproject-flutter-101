import 'package:flutter/material.dart';

class IASHome extends StatefulWidget {
  const IASHome({super.key});

  @override
  State<IASHome> createState() => _IASHomeState();
}

class _IASHomeState extends State<IASHome> {
  String text = "";
  TextEditingController textEditingController = TextEditingController();

  TextEditingController alertController = TextEditingController();
  void _alertDialog(String str) {
    if (str.isEmpty) return;

    AlertDialog alertDialog = AlertDialog(
      content: Text(
        str,
        style: TextStyle(fontSize: 20.0),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
          ),
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  TextEditingController snackbarController = TextEditingController();
  
  void _snackbar(String str) {
    if (str.isEmpty) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(str),
        action: SnackBarAction(
          label: 'Action',
          onPressed: () {
            // Code to execute.
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter 101",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: textEditingController,
            decoration:
                const InputDecoration(hintText: "Please fill this field"),
            // onChanged: (String? str){
            //   setState((){
            //     text = "loading...";
            //   });
            // },
            onFieldSubmitted: (value) => setState(() {
              text = value + "\n" + text;
              textEditingController.text = "";
            }),
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 20.0),
          ),
          TextFormField(
            controller: alertController,
            decoration: const InputDecoration(hintText: "Field for alert"),
            onFieldSubmitted: (value) => _alertDialog(value),
          ),
          TextFormField(
            controller: snackbarController,
            decoration: const InputDecoration(hintText: "Field for snackbar"),
            onFieldSubmitted: (value) => _snackbar(value),
          ),
        ],
      ),
    );
  }
}
