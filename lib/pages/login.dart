import 'package:flutter/material.dart';
import 'package:pas_kelas11/reusable_widgets.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController usncontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Sign In"),
            reusableTextField("Username", Icons.person_outlined, false, usncontroller)

          ],
        ),
      ),
    );
  }
}
