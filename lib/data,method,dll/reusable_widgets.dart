import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//
// TextField reusableTextField(String text, IconData icon, bool isPasswordType,
//     TextEditingController controller) {
//   return TextField(
//     controller: controller,
//     obscureText: isPasswordType,
//     enableSuggestions: !isPasswordType,
//     autocorrect: !isPasswordType,
//     cursorColor: Colors.white,
//     style: TextStyle(color: Colors.white.withOpacity(0.9)),
//     decoration: InputDecoration(
//       prefixIcon: Icon(
//         icon,
//         color: Colors.white70,
//       ),
//       labelText: text,
//       labelStyle: TextStyle(color: Colors.white.withOpacity(0.9)),
//       filled: true,
//       floatingLabelBehavior: FloatingLabelBehavior.never,
//       fillColor: Colors.white.withOpacity(0.3),
//       border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: const BorderSide(width: 0)),
//     ),
//     keyboardType: isPasswordType
//         ? TextInputType.visiblePassword
//         : TextInputType.emailAddress,
//   );
// }

class TextFieldInput extends StatelessWidget {
  final String label;
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;
  final IconData? icon;
  final Function(String)? onchanged;

  const TextFieldInput({
    Key? key,
    required this.textEditingController,
    this.isPass = false ,
    required this.hintText,
    required this.textInputType,
    required this.label,
    required this.icon,
    this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          margin: EdgeInsets.only(left: 20),
          child: Text(
            label,
            style: TextStyle(
              color: Color(0xFF979797),
              fontSize: 11,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Color(0xFFECEFFB),
              width: 2,
            ),
          ),
          height: 50,
          child: TextField(
            obscureText: isPass,
            controller: textEditingController,
            style: TextStyle(color: Colors.black),
            onChanged: onchanged,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 8, bottom: 10, left: 10),
              suffixIcon: Icon(
                icon,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}


Widget buildButton({
  required String text,
  void Function()? onPressed,
}) {
  return MaterialButton(
    onPressed: onPressed,
    color: Color(0xFF1e1d2e),
    textColor: Colors.white,
    child: Text(
      text,
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
  );
}



