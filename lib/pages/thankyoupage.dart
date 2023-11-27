import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_kelas11/pages/home_page.dart';


import '../data,method,dll/reusable_widgets.dart';



class ThankYouPage extends StatelessWidget {
  final double screenWidth = 600;
  final double screenHeight = 400;
  final Color themeColor = const Color(0xFF43D19E);
  final Color textColor = const Color(0xFF32567A);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 170,
              padding: EdgeInsets.all(35),
              decoration: BoxDecoration(
                color: themeColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "asset/check.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: screenHeight * 0.1),
            textbuild(text: "Thank You!", color: Colors.black, fontSize: 36, fontWeight: FontWeight.bold, height: 0),
            SizedBox(height: screenHeight * 0.01),
            textbuild(text: "Payment Done Successfully", color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400, height: 0),

            SizedBox(height: screenHeight * 0.06),
            Flexible(
              child: MaterialButton(
                onPressed: (){
                  Get.off(() => HomePage());
                },
                color: primaryColor,
                textColor: Colors.white,
                child: Text(
                  "Done",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.only(top: 15,bottom: 15,left: 130,right: 130),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}