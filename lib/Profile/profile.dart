import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../data,method,dll./reusable_widgets.dart';
import '../data,method,dll/allmethod.dart';
import 'ProfileController.dart';


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
        future: _controller.getDataFromFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Loading state
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            // Error state
            return Text('Error: ${snapshot.error}');
          } else {
            // Data loaded successfully
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
                        backgroundImage: AssetImage('assets/profile_image.jpg'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Name: ${snapshot.data!['name']}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Email: ${snapshot.data!['email']}",
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
}