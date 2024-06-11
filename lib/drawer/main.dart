import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/drawer/profile.dart';

class DHome extends StatefulWidget {
  const DHome({super.key});

  @override
  State<DHome> createState() => _DHomeState();
}

class _DHomeState extends State<DHome> {
  String accountImage1 =
      "https://w7.pngwing.com/pngs/328/599/png-transparent-male-avatar-user-profile-profile-heroes-necktie-recruiter.png";
  String accountImage2 = "https://cdn-icons-png.flaticon.com/512/53/53176.png";
  late String backuppedImage;

  String name1 = "Duds";
  String name2 = "Haris";
  late String backupedName;

  String email1 = "duds@mail.com";
  String email2 = "haris@mail.com";
  late String backupedEmail;

  void changeUser() {
    setState(() {
      backuppedImage = accountImage1;
      accountImage1 = accountImage2;
      accountImage2 = backuppedImage;

      backupedName = name1;
      name1 = name2;
      name2 = backupedName;

      backupedEmail = email1;
      email1 = email2;
      email2 = backupedEmail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Drawer",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(name1),
              accountEmail: Text(email1),
              currentAccountPicture: GestureDetector(
                onTap: () => {
                  Navigator.of(context).pop(),
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => Profile(
                        name: name1, email: email1, image: accountImage1)))
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(accountImage1),
                ),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://blog.sebastiano.dev/content/images/2019/07/1_l3wujEgEKOecwVzf_dqVrQ.jpeg"),
                      fit: BoxFit.cover)),
              otherAccountsPictures: [
                GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(accountImage2),
                  ),
                  onTap: () {
                    changeUser();
                  },
                ),
              ],
            ),
            const ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.settings),
            ),
            const ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
            )
          ],
        ),
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
