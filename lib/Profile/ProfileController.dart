import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProfileController {

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userEmail") ?? "";
  }

  static Future<String> getUserDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("userDisplayName") ?? "";
  }

  Future<Map<String, String>> getDataFromFirebase() async {
    try {

      User? user = FirebaseAuth.instance.currentUser;

      print(user);
      if (user != null) {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection("users").doc(user.uid).get();

        if (snapshot.exists) {
          Map<String, dynamic> data = snapshot.data() ?? {};
          return {
            'name': data['name'] as String? ?? '',
            'email': data['email'] as String? ?? '',
          };
        }
      }
    } catch (e) {
      // Handle error
      print("Error fetching data: $e");
    }

    return {'name': 'user', 'email': ''};
  }

}