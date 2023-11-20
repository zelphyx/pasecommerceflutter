import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data,method,dll./reusable_widgets.dart';
import '../data,method,dll/allmethod.dart';


class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}


class _profileState extends State<profile> {
  String? name = '';
  String? email = '';

  @override
  void initState() {
    super.initState();
    _getDatafromFirebase();
  }

  Future<void> _getDatafromFirebase() async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((snapshot) {
      if (snapshot.exists) {
        setState(() {
          name = snapshot.data()!['name'];
          email = snapshot.data()!['email'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textbuild(text: 'My Profile', color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, height: 0),
      ),
      drawer: NavDrawer(),
      body: Container(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              textbuild(
                  text: "Name : ${name!}",
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 0),
              textbuild(
                  text: "Email : ${email!}",
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 0),
            ],
          ),
        ),
      ),
    );
  }
}
