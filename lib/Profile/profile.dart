import 'package:flutter/material.dart';
import '../data,method,dll/allmethod.dart';
import 'ProfileController.dart';
import 'TestController.dart';

class Profile extends StatelessWidget {
  final ProfileController _controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      drawer: NavDrawer(),
      body: FutureBuilder<Map<String, String>>(
        future: _getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Error state
            return Text('Error: ${snapshot.error}');
          } else {
            String displayName = snapshot.data?['displayName'] ?? "Default Name";
            String displayEmail = snapshot.data?['email'] ?? "Default Email";

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('asset/gopay.png'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Name: $displayName",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Email: $displayEmail",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  Future<Map<String, String>> _getUserInfo() async {
    String loginType = await SharedPreferencesHelper.getLoginType();
    String email = await SharedPreferencesHelper.getUserEmail();
    String displayName = await SharedPreferencesHelper.getUserDisplayName();

    if (loginType == "email") {

      Map<String, String> firestoreData = await _controller.getDataFromFirebase();
      displayName = firestoreData['name'] ?? "Default Name";
      email = firestoreData['email'] ?? "Default Name";
    }

    return {'email': email, 'displayName': displayName};
  }

}
