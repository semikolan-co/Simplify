import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:todo/homeScreen.dart';

import 'firebase_auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final databaseRef = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButtonGoogle(),
              _signInButtonGithub()
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButtonGoogle() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (FirebaseAuth.instance.currentUser != null) {
            print(FirebaseAuth.instance.currentUser);
            databaseRef
                .child('users')
                .child(FirebaseAuth.instance.currentUser!.uid)
                .once()
                .then((DataSnapshot snapshot) {
              if (snapshot.value == null) {
                databaseRef
                    .child('users')
                    .child(FirebaseAuth.instance.currentUser!.uid)
                    .set({
                  'name': FirebaseAuth.instance.currentUser!.displayName,
                  'email': FirebaseAuth.instance.currentUser!.email,
                  'photoUrl': FirebaseAuth.instance.currentUser!.photoURL,
                  'uid': FirebaseAuth.instance.currentUser!.uid,
                  'todo': null,
                  'points': 0,
                });
              }
            });
            // databaseRef
            //     .child('users')
            //     .child(FirebaseAuth.instance.currentUser!.uid)
            //     .set({
            //   'todo': {},
            //   'points': 0,
            //   'name': FirebaseAuth.instance.currentUser!.displayName,
            //   'email': FirebaseAuth.instance.currentUser!.email,
            //   'photoUrl': FirebaseAuth.instance.currentUser!.photoURL,
            // });
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _signInButtonGithub() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        // signInWithGitHub(context).then((result) {
        //   if (result != null) {
        //     Navigator.of(context).push(
        //       MaterialPageRoute(
        //         builder: (context) {
        //           return HomeScreen();
        //         },
        //       ),
        //     );
        //   }
        // });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Github',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
