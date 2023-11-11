import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll./ProductController.dart';

class home extends StatelessWidget {
  final controller = Get.put(ControllerProduct());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${controller.sessionUsername}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add any functionality you want here
              },
              child: Text('Perform Action'),
            ),
          ],
        ),
      ),
    );
  }
}
