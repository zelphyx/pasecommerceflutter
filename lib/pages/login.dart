import 'package:flutter/material.dart';
import 'package:pas_kelas11/pages/register.dart';
import 'package:pas_kelas11/reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
        child: Container(
        child: Column(
          children: [
            SizedBox(height: mediaheight * 0.02,),
            Center(
              child: Image.asset(
                'asset/asset1.jpg',
                width: mediawidth * 0.8,
              ),
            ),
            Text("Welcome Back!",style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w900
            ),),SizedBox(height: mediaheight * 0.05,),
            buildTextTop(textForLabel: "Email Address",icon: Icons.mail,controller: usncontroller),
            SizedBox(height: mediaheight * 0.015,),
            buildTextTop(textForLabel: "Password",isPasswordType:true,icon: Icons.lock,controller: pwcontroller),
            InkWell(
              onTap: () {
                // Add your click action here
              },
              child: Container(
                margin: EdgeInsets.only( right: 20, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 11,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: mediaheight * 0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(child: Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                  ),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('Or',
                        style: TextStyle(color: Colors.grey[700],fontFamily:GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold ),
                      )

                  ),

                  Expanded(child: Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                  ),
                  ),
                ],
              ),
            ),
            SizedBox(height: mediaheight * 0.03,),
            InkWell(
              onTap: () {
                // Add your click action here
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color(0xFFECEFFB),
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    'asset/googs.png',
                    width: 25,
                    height: 25,
                  ),
                ),
              ),
            ),
          SizedBox(height: mediaheight * 0.1,),
          buildButton(text: "SIGN IN",onPressed: (){

          }),
            SizedBox(height: mediaheight * 0.005,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Dont Have an Account?",style: TextStyle(
                color: Colors.black,
                fontSize: 11,
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
              ),
            ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                },
                child:
                      Text(
                        'Signup Now',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 11,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
            ],),
            SizedBox(height: mediaheight * 0.1,)
            //
            //


          ],
        ),
      ),
        )
    );
  }
}
