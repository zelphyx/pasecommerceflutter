
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pas_kelas11/Profile/profile.dart';

import 'package:pas_kelas11/data,method,dll./AuthMethod.dart';

import 'package:pas_kelas11/data,method,dll./reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_kelas11/data,method,dll./snackbar.dart';
import 'package:pas_kelas11/pages/home_page.dart';
import 'package:pas_kelas11/pages/test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Profile/TestController.dart';
import 'ForgotPass.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ]
);
class loginpage extends StatefulWidget {
  const loginpage({super.key});


  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  late SharedPreferences prefs;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  GoogleSignInAccount? _currentUser;
  bool ShowSpinner = false;
  bool isLoading = false;
  Future<void> setPreference() async {
    prefs = await SharedPreferences.getInstance();
  }
  void loginUser() async {
    await setPreference();
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethod().loginUser(
        email: emailcontroller.text, password: pwcontroller.text);
    if (res == "Success") {

      setState(() {
        isLoading = false;
      });
      await prefs.setString("loginType", "email");
      Get.to(() => HomePage());
      if (_currentUser != null) {
        await Get.to(() => Profile()
        );
      } else {
        setState(() {
          isLoading = false;
        });
        showsnackbar(context, res);
      }
    }
  }
  void handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();
      await _googleSignIn.signIn();

      showsnackbar(context,"Login success");
      setGoogleSignInPreferences();
      Get.off(() => HomePage());
    } catch (error) {
      print(error);
    }
  }

  void setGoogleSignInPreferences() async {
    await setPreference();
    await prefs.setString("loginType", "google");
    await prefs.setString("userEmail", _currentUser!.email ?? "");
    await prefs.setString("userDisplayName", _currentUser!.displayName ?? "");
  }

  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
        print(_currentUser);
      });
    });

    _googleSignIn.signInSilently();
  }

  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: _currentUser == null? ListView(
          children: [
            Container(
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
                  ),
                  ),
                  SizedBox(height: mediaheight * 0.05,),
                  TextFieldInput(textEditingController: emailcontroller, hintText: "Insert Your Email", textInputType: TextInputType.text, label: "Email", icon: Icons.email),
                  SizedBox(height: mediaheight * 0.015,),
                  TextFieldInput(textEditingController: pwcontroller,isPass:true, hintText: "Insert Your Password", textInputType: TextInputType.text, label: "Password" ,icon: Icons.lock),
                  GestureDetector(
                    onTap: () {
                      print("hai berhasil");
                      Get.to(() =>ForgotPass());
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
                      handleGoogleSignIn();
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
                  buildButton(text: "SIGN IN", onPressed: loginUser),

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
                          Get.offNamed('/register');
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
          ],
        ) : HomePage()
      //
      //     Container(child: ListTile(
      //       leading: GoogleUserCircleAvatar(identity: _currentUser!,),
      //       title: Text(_currentUser!.displayName ?? ''),
      //       subtitle: Text(_currentUser!.email),
      // trailing: IconButton(
      // onPressed: (){
      // _googleSignIn.disconnect();
      // }, icon: Icon(Icons.logout),
      //     ),
      //     )
      //     )
    );
  }

  @override
  void dispose() {
    super.dispose();
    emailcontroller.dispose();
    pwcontroller.dispose();
  }


}


