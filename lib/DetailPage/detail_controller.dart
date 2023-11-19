import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/EcommerceListModel.dart';

class DetailController extends GetxController {
  RxList<Ecommercelistmodel> listmodelctr = <Ecommercelistmodel>[].obs;
  List<Ecommercelistmodel> ecommercelistmodel = [];

  Rx<Ecommercelistmodel?> selectedProduct = Rx<Ecommercelistmodel?>(null);
  PageController pageController = PageController();
  int currentPage = 0;

  void init() {
    pageController.addListener(() {
      currentPage = pageController.page?.round() ?? 0;
    });
  }

  @override
  void onInit() {
    super.onInit();
    print("DetailController initialized");
    init();


    var arguments = Get.arguments;

    if (arguments != null && arguments is int) {
      int productId = arguments;


      selectedProduct.value = fetchProductDetailsById(productId);
    } else {

      selectedProduct.value = null;
    }
  }


  Ecommercelistmodel? fetchProductDetailsById(int productId) {
    return ecommercelistmodel.firstWhere(
          (product) => product.id == productId,
      orElse: () =>Ecommercelistmodel(id: -1, title:'Product Not Found', price: 0.0,image: "") ,
    );
  }

  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

