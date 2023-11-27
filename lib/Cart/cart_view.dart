import 'package:flutter/material.dart';
import 'package:pas_kelas11/Cart/CardCart.dart';
import 'package:pas_kelas11/Cart/cart_controller.dart';
import 'package:pas_kelas11/Payment/PaymentPage.dart';
import 'package:pas_kelas11/data,method,dll./reusable_widgets.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/ProductController.dart';
import '../data,method,dll/allmethod.dart';

class Cart extends StatelessWidget {

  final currentidx = 1;

  @override
  Widget build(BuildContext context) {
    return _CartContent();
  }
}

class _CartContent extends StatefulWidget {

  @override
  _CartContentState createState() => _CartContentState();
}

class _CartContentState extends State<_CartContent> {
  final CartController cartcontroller = Get.put(CartController());
  TextEditingController promoCodeController = TextEditingController();
  String appliedPromoCode = '';


  void applyPromoCode() {
    setState(() {
      appliedPromoCode = promoCodeController.text;

    });
  }


  void checkout() {
    if (cartcontroller.cartlist.isEmpty) {
      Get.snackbar('Empty Cart', 'The Cart is Empty',
          snackPosition: SnackPosition.TOP);
    } else {
      Get.to(() => paymentoption());
    }
  }

  double get totalDiscount {

    return 0.0;
  }

  double get totalPrice {
    double sum = 0.0;


    for (var cartItem in cartcontroller.cartlist) {
      sum += cartItem.price;
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {

    final CartController cartcontroller = Get.put(CartController());
    Size mediasize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: textbuild(
          text: 'My Cart',
          color: Colors.black,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          height: 0,
        ),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [

                Container(
                  width: mediasize.width,
                  height: mediasize.height*0.49,
                  child: Obx(()=> cartcontroller.isload == true ?
                  ListView.builder(
                    itemCount: cartcontroller.cartlist.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return cartt(cartitem: cartcontroller.cartlist.value[index]);
                    },
                  ) :
                  ListView.builder(
                    itemCount: cartcontroller.cartlist.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return cartt(cartitem: cartcontroller.cartlist.value[index]);
                    },
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Promo Code',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10.0, right: 8.0),
                                    child: TextFormField(
                                      controller: promoCodeController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter promo code',
                                        hintStyle: TextStyle(color: Colors.grey),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => applyPromoCode(),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Apply',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomAppBar(
        height: MediaQuery.of(context).size.height * 0.17,
        child: Column(
          children: [
            if (appliedPromoCode.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Applied Promo Code:',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      '$appliedPromoCode',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            if (totalDiscount > 0)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Discount:',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      'Rp. ${totalDiscount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Container(
                width: double.infinity,
                height: 70.0,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      checkout();
                    },
                    borderRadius: BorderRadius.circular(15.0),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Proceed to Checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({required this.name, required this.price, required this.quantity});
}