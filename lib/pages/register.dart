import 'package:flutter/material.dart';
import 'package:pas_kelas11/pages/login.dart';
import 'package:pas_kelas11/reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                Text("Become Our Member!",style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w900
                ),),SizedBox(height: mediaheight * 0.05,),
                buildTextTop(textForLabel: "Email Address",icon: Icons.mail,controller: usncontroller),
                SizedBox(height: mediaheight * 0.015,),
                buildTextTop(textForLabel: "Password",icon: Icons.lock,controller: pwcontroller),
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
                buildButton(text: "SIGN UP",onPressed: (){

                }),
                SizedBox(height: mediaheight * 0.005,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have An Account?",style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                    ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => loginpage()));
                      },
                      child:
                      Text(
                        'SIGN IN',
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
                //\



              ],
            ),
          ),
        )
    );
  }
  }

