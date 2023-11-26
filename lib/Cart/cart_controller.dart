import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/EcommerceListModel.dart';

class CartController extends GetxController{
  RxList<Ecommercelistmodel> cartlist = <Ecommercelistmodel>[].obs;
  RxBool isload = false.obs;
  var isGopayChecked = false.obs;


  void updateRefreshFlag() {
    isload.toggle();
  }




  addToCart(BuildContext context, Ecommercelistmodel newItem) {
    bool isExisting = false;

    for (var item in cartlist.value) {
      if (item.id == newItem.id) {
        isExisting = true;
        break;
      }
    }


    if (!isExisting) {
      cartlist.value.add(newItem);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item added to cart.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This item is already in the cart.'),
          duration: Duration(seconds: 2),
        ),
      );
    }

    print("add ${newItem.title}");
    for (var item in cartlist.value) {
      print("old data : ${item.title}");
    }
  }


  removeFromCart(BuildContext context, int id, String name) {
    cartlist.value.removeWhere((item) => item.id == id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name telah dihapus dari keranjang.'),
        duration: Duration(seconds: 2),
      ),
    );

    print("remove $name");
    for (var item in cartlist.value) {
      print("old data : ${item.title}");
    }

    isload.value = !isload  .value;
  }

}


