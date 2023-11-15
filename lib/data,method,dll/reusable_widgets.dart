import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFF1e1d2e);
const Color textColor = Color(0xFF979797);
const Color hintColor = Color(0xFFECEFFB);


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
              color:textColor,
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
              color: hintColor,
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
    color: primaryColor,
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

class textbuild extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final double? height;
  final double? letterSpacing;

  textbuild({
    required this.text,
    required this.color,
    required this.fontSize,
    required this.fontWeight,
    required this.height,
    this.letterSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
      ),
    );
  }
}


Widget builddiskon({
  required String discountPercentage,
  required String itemDescription,
  required String couponCode,
  required String buttonText,
}) {
  return Padding(
    padding: EdgeInsets.only(right: 20.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Get Discount " + discountPercentage,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  itemDescription,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'With Code: $couponCode',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class customcategorybutton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  customcategorybutton({
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


class buildcard extends StatelessWidget {
  final double mediaHeight;
  final String imageUrl;
  final String? title;
  final double? price;

  buildcard({
    required this.mediaHeight,
    required this.imageUrl,
    this.title,
    this.price
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              SizedBox(height: mediaHeight * 0.004,),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                  child: SizedBox(
                    height: mediaHeight,
                    child: Image.network(
                      imageUrl,
                      height: mediaHeight,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title!,
                  style: TextStyle(
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                   " \$${price.toString()}",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}




