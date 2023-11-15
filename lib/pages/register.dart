import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pas_kelas11/data,method,dll./AuthMethod.dart';
import 'package:pas_kelas11/pages/login.dart';
import 'package:pas_kelas11/data,method,dll./reusable_widgets.dart';
import 'package:pas_kelas11/data,method,dll./snackbar.dart';
import 'package:get/get.dart';




GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ]
);

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController usncontroller = TextEditingController();
  TextEditingController pwcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  bool isLoading = false;

  GoogleSignInAccount? _currentUser;

  @override
  void dispose() {
    super.dispose();
    usncontroller.dispose();
    pwcontroller.dispose();
    emailcontroller.dispose();
  }

  void signUpuser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethod().signUpUser(
        email: emailcontroller.text,
        password: pwcontroller.text,
        name: usncontroller.text);
    if (res == "Success") {
      setState(() {
        isLoading = false;
      });
      Get.toNamed("/login");
    } else {
      setState(() {
        isLoading = false;
      });
      showsnackbar(context, res);
    }
  }

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  Future<void> _handleRegister() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _currentUser == null
          ? ListView(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height: mediaheight * 0.02,
                ),
                Center(
                  child: Image.asset(
                    'asset/asset1.jpg',
                    width: mediawidth * 0.8,
                  ),
                ),
                Text(
                  "Become Our Member!",
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: mediaheight * 0.05,),
                TextFieldInput(
                  textEditingController: usncontroller,
                  hintText: "Insert Your Username",
                  textInputType: TextInputType.text,
                  label: "Username",
                  icon: Icons.person,
                ),
                SizedBox(height: mediaheight * 0.01,),
                TextFieldInput(
                  textEditingController: emailcontroller,
                  hintText: "Insert Your Email",
                  textInputType: TextInputType.text,
                  label: "Email",
                  icon: Icons.email,
                ),
                SizedBox(height: mediaheight * 0.01,),
                TextFieldInput(
                  textEditingController: pwcontroller,
                  hintText: "Insert Your Password",
                  textInputType: TextInputType.text,
                  label: "Password",
                  icon: Icons.lock,
                ),
                SizedBox(height: mediaheight * 0.02,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Divider(
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
                    _handleRegister();
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
                buildButton(text: "SIGN UP", onPressed: () {
                  signUpuser();
                }),
                SizedBox(height: mediaheight * 0.005,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an Account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed("/login");
                      },
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 11,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: mediaheight * 0.1,),
              ],
            ),
          ),
        ],
      )
          : loginpage(),
    );
  }
}

