import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/EcommerceListModel.dart';


class ControllerWishlist extends GetxController{
  RxList<Ecommercelistmodel> wishlistitemList = <Ecommercelistmodel>[].obs;
  RxBool isRefresh = false.obs;

  void updateRefreshFlag() {
    isRefresh.toggle();
  }

  add(BuildContext context, Ecommercelistmodel newItem) {
    bool isExisting = false;

    for (var item in wishlistitemList.value) {
      if (item.id == newItem.id) {
        isExisting = true;
        break;
      }
    }

    if (!isExisting) {
      wishlistitemList.value.add(newItem);
      updateRefreshFlag(); // Update the refresh flag
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Item added to Wishlist.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This item is already in the Wishlist.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  remove(BuildContext context, int id, String title) {
    wishlistitemList.value.removeWhere((item) => item.id == id);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$title Deleted from Wishlist.'),
        duration: Duration(seconds: 2),
      ),
    );

    isRefresh.value = !isRefresh.value;
  }
}