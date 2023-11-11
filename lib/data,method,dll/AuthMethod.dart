import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


  //SIGNUP
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty || name.isEmpty) {
        return "All fields must be filled";
      } else {

        UserCredential cred =
        await auth.createUserWithEmailAndPassword(email: email, password: password);

        await firestore.collection("users").doc(cred.user!.uid).set({
          'name': name,
          'password': password,
          'email': email,
        });

        return "Success";

      }
    } catch (err) {
      return err.toString();
    }
  }


  //LOGIN
  Future<String> loginUser ({
    required String email,
    required String password
})async{
    String res = "Some error Occurred";
    try{
      if (email.isEmpty || password.isEmpty){
        return "All Field Must Be Filled And Not Empty";
      }else{
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res = "Success";
      }
    }catch (err) {
      err.toString();
    }
    return res;
  }


  //SignOut
  Future<void>signout() async{
    await auth.signOut();
  }
}
