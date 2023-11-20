import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/Wishlist/CardWishlist.dart';
import 'package:pas_kelas11/Wishlist/WishlistController.dart';
import 'package:pas_kelas11/data,method,dll/ProductController.dart';
import 'package:pas_kelas11/data,method,dll/allmethod.dart';

import '../data,method,dll./reusable_widgets.dart';

class wishlistpage extends StatelessWidget {
  final ecommercecontroller = Get.put(ControllerProduct());
  final ControllerWishlist controllerwishlist = Get.put(ControllerWishlist());

  
  @override
  Widget build(BuildContext context) {
    Size mediasize = MediaQuery.of(context).size;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: textbuild(text: 'My Wishlist', color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, height: 0),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: mediasize.width,
              height: mediasize.height*0.49,
              child: Obx(()=> controllerwishlist.isRefresh == true ?
              ListView.builder(
                itemCount: controllerwishlist.wishlistitemList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return wishlistcard(wishlistitem: controllerwishlist.wishlistitemList.value[index]);
                },
              ) :
              ListView.builder(
                itemCount: controllerwishlist.wishlistitemList.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return wishlistcard(wishlistitem: controllerwishlist.wishlistitemList.value[index]);
                },
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
