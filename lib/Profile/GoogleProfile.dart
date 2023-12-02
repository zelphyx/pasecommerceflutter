import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pas_kelas11/data,method,dll./reusable_widgets.dart';



class GoogleProfile extends StatelessWidget {

  late GoogleSignIn _googleSignIn;
  late User _user;

  GoogleProfile(User user, GoogleSignIn signIn) {
    _user = user;
    _googleSignIn = signIn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            ClipOval(
                child: Image.network(
                    _user.photoURL ?? 'https://placehold.co/600x400/000000/FFFFFF.png',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover
                )
            ),
            Text(_user.displayName ?? 'no Name',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
            ElevatedButton(onPressed: () {
              _googleSignIn.signOut();
              Navigator.pop(context);
            }, child: textbuild(text: 'Logout', color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold, height: 0))
          ],
        ),
      ),
    );
  }
}