import 'package:flutter/material.dart';

import '../data,method,dll./reusable_widgets.dart';
import '../data,method,dll/allmethod.dart';



class profile extends StatelessWidget {
  const profile({super.key});
  final currentidx = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: textbuild(text: 'My Profile', color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, height: 0),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Test profile')
          ],
        ),
      ),
    );
  }
}
