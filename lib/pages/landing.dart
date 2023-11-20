import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll./reusable_widgets.dart';


class landing extends StatelessWidget {
  const landing({super.key});

  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/logozzz.png'),
              SizedBox(height: mediaheight * 0.05,),
              textbuild(text: 'Welcome to Shopzo', color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold, height: 0),
              textbuild(text: 'A Place to Find Your Needs', color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300, height: 0),
              SizedBox(height: mediaheight * 0.15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Get.offNamed('/register');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              SizedBox(width: mediawidth * 0.05,),
              TextButton(
                onPressed: () {
                  Get.offNamed('/login');
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 12.0),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black,width: 2,style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}
