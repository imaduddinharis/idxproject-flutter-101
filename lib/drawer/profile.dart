import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile(
      {required this.name,
      required this.email,
      required this.image,
      super.key});

  final String name;
  final String email;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 100,
            ),
            Text(name),
            Text(email),
          ],
        ),
      ),
    );
  }
}
