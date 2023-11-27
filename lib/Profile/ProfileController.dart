import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ProfileController {
  Future<Map<String, String>> getDataFromFirebase() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        return {
          'name': data['name'] as String,
          'email': data['email'] as String,
        };
      }
    } catch (e) {
      // Handle error
      print("Error fetching data: $e");
    }

    return {'name': '', 'email': ''};
  }
}