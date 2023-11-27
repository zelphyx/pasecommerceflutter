import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pas_kelas11/data,method,dll./reusable_widgets.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/pages/thankyoupage.dart';

import '../Cart/cart_controller.dart';

class paymentoption extends StatefulWidget {
  @override
  _PaymentOptionState createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<paymentoption> {
  String selectedOption = "";
  final CartController cartcontroller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Options"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                paymentOptionItem(
                  label: "GoPay",
                  isSelected: selectedOption == "GoPay",
                  onSelected: () {
                    setState(() {
                      selectedOption = "GoPay";
                    });
                  },
                  image: Image.asset("asset/gopay.png")
                ),
                paymentOptionItem(
                  label: "Dana",
                  isSelected: selectedOption == "Dana",
                  onSelected: () {
                    setState(() {
                      selectedOption = "Dana";
                    });
                  },
                    image: Image.asset("asset/dana.png")
                ),
                paymentOptionItem(
                  label: "PayPal",
                  isSelected: selectedOption == "PayPal",
                  onSelected: () {
                    setState(() {
                      selectedOption = "PayPal";
                    });
                  },
                    image: Image.asset("asset/paypal.png")
                ),
                paymentOptionItem(
                  label: "OVO",
                  isSelected: selectedOption == "OVO",
                  onSelected: () {
                    setState(() {
                      selectedOption = "OVO";
                    });
                  },
                    image: Image.asset("asset/ovo.png")
                ),
                paymentOptionItem(
                  label: "Bank Transfer",
                  isSelected: selectedOption == "Bank Transfer",
                  onSelected: () {
                    setState(() {
                      selectedOption = "Bank Transfer";
                    });
                  },
                    image: Image.asset("asset/mastercard.png")
                ),
                paymentOptionItem(
                  label: "Cash on Delivery",
                  isSelected: selectedOption == "COD",
                  onSelected: () {
                    setState(() {
                      selectedOption = "COD";
                    });
                  },
                    image: Image.asset("asset/cod.png")
                ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
            MaterialButton(
              onPressed: (){
                cartcontroller.cartlist.clear();
                Get.off(() => ThankYouPage());
              },
              color: primaryColor,
              textColor: Colors.white,
              child: Text(
                "Pay",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget paymentOptionItem({
  required String label,
  required bool isSelected,
  required VoidCallback onSelected,
  required Image image
}) {
  return InkWell(
    onTap: onSelected,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blueGrey : Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
          Spacer(),
          SizedBox(
            width: 50, // Set the desired width
            height: 50, // Set the desired height
            child: image,
          ),
          
        ],
      ),
    ),
  );
}
