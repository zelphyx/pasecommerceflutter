import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/reusable_widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pas_kelas11/data,method,dll/snackbar.dart';

class ForgotPass extends StatelessWidget {
  ForgotPass({Key? key});

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Receive an Email to Your account to Reset The Password"),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.002,),
              TextFormField(
                controller: emailController,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(labelText: "Email"),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (email) =>
                email != null && !EmailValidator.validate(email)
                    ? "Enter A Valid Email"
                    : null,
              ),
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.002,),
              buildButton(
                text: "Reset Password",
                onPressed: () => resetpassword(context),

              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> resetpassword(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(child: CircularProgressIndicator()),
    );

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: emailController.text.trim(),
      ).then((value) => Get.back());

      showsnackbar(context, "Email Sent Successfully to ${emailController.text.toString()}");

      await Future.delayed(Duration(seconds: 1));



    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      showsnackbar(context, "Error: ${e.message}");
    } catch (e) {
      print("Error: $e");
      showsnackbar(context, "Error: $e");
    } finally {
      
      Get.back();
    }
  }
}
