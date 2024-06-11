import 'package:flutter/material.dart';

class FHome extends StatefulWidget {
  const FHome({super.key});

  @override
  State<FHome> createState() => _FHomeState();
}

class _FHomeState extends State<FHome> {
  String _gender = "";
  void selectGender(String? value) {
    setState(() {
      _gender = value!;
    });
  }

  final List<String> religions = [
    "Islam",
    "Christian",
    "Chatolic",
    "Jews",
    "Hindu",
    "Budha"
  ];
  String _religion = "Islam";
  void selectReligion(String value) {
    setState(() {
      _religion = value;
    });
  }

  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerAbout = TextEditingController();

  void postData() {
    AlertDialog alertDialog = AlertDialog(
      content: SizedBox(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min, children: [
          Text("Name : ${controllerName.text}"),
          Text("Password : ${controllerPassword.text}"),
          Text("About : ${controllerAbout.text}"),
          Text("Gender : $_gender"),
          Text("Religion : $_religion"),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          Row(
            children: [
              Expanded(child: ElevatedButton(onPressed: ()=>Navigator.pop(context), child: const Text("OK"))),
            ],
          )
        ]),
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: controllerName,
                    decoration: InputDecoration(
                        hintText: "Full Name",
                        labelText: "Full Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextField(
                    controller: controllerPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20.0)),
                  TextField(
                    controller: controllerAbout,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText: "About",
                        labelText: "About",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0))),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20.0)),
                  RadioListTile(
                    value: "Male",
                    title: const Text("Male"),
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        selectGender(value);
                      });
                    },
                    activeColor: Colors.blue,
                    subtitle: const Text("Select your gender"),
                  ),
                  RadioListTile(
                    value: "Female",
                    title: const Text("Female"),
                    groupValue: _gender,
                    onChanged: (String? value) {
                      setState(() {
                        selectGender(value);
                      });
                    },
                    activeColor: Colors.blue,
                    subtitle: const Text("Select your gender"),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 20.0)),
                  Row(
                    children: [
                      const Text(
                        "Religion",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      const Padding(padding: EdgeInsets.only(left: 20.0)),
                      DropdownButton(
                        items: religions.map((String value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          selectReligion(value!);
                        },
                        value: _religion,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              postData();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white
                            ),
                            child: const Text("Submit")),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
