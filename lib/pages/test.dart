import 'package:flutter/material.dart';

import '../Profile/TestController.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: FutureBuilder(
        future: _getUserInfo(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Email: ${snapshot.data?['email']}'),
                  Text('Display Name: ${snapshot.data?['displayName']}'),
                ],
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }

  Future<Map<String, String>> _getUserInfo() async {
    String email = await SharedPreferencesHelper.getUserEmail();
    String displayName = await SharedPreferencesHelper.getUserDisplayName();

    return {'email': email, 'displayName': displayName};
  }
}
