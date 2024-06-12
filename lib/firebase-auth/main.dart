import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FALogin extends StatefulWidget {
  const FALogin({super.key});

  @override
  State<FALogin> createState() => _FALoginState();
}

class _FALoginState extends State<FALogin> {
  String name = "";
  String image = "";

    final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<User?> currentUser() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignInAccount? account = await googleSignIn.signIn();
    final GoogleSignInAuthentication? authentication =
        await account?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication?.idToken,
        accessToken: authentication?.accessToken);

    final UserCredential authResult =
        await auth.signInWithCredential(credential);
    final User? user = authResult.user;

    setState(() {
      name = user!.displayName!;
      image = user.photoURL!;
    });

    _alertDialog();

    return user;
  }

  void _alertDialog() {
    AlertDialog alertDialog = AlertDialog(
      content: SizedBox(
        height: 200.0,
        child: Column(
          children: [
            const Text(
              "Authenticated",
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            const Divider(),
            Image.network(image),
            Text("You are login as $name"),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (BuildContext context) => alertDialog);
  }

  void signOut(){
    googleSignIn.signOut();
    print("unauthenticated");
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp(
            options: const FirebaseOptions(
                apiKey: "AIzaSyBmuX8C26UnoJR9lj45yfTeX9tURFfpQr8",
                appId: "AIzaSyBmuX8C26UnoJR9lj45yfTeX9tURFfpQr8",
                messagingSenderId: "639080017532",
                projectId: "login-flutter-idx"))
        .whenComplete(() {
      // print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Auth'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () =>
                    currentUser().then((User? user) => print(user)),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red, foregroundColor: Colors.white),
                child: const Row(
                  children: [
                    Icon(Icons.plus_one),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Text('Login with Google+'),
                  ],
                )),
            ElevatedButton(
                onPressed: () => signOut(),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white),
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    Padding(padding: EdgeInsets.only(right: 10.0)),
                    Text('Sign Out'),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
