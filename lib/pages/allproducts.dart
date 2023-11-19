import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/allmethod.dart';
import 'package:pas_kelas11/data,method,dll/EcommerceListModel.dart';
import '../DetailPage/detail_view.dart';
import '../data,method,dll./reusable_widgets.dart';
import '../data,method,dll/ProductController.dart';

class allproducts extends StatelessWidget {
  final ecommercecontroller = Get.put(ControllerProduct());


  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        actions: [
          buildsearchbar(ecommercecontroller)
        ],
      ),
      body: ListView(
        children: [
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: ecommercecontroller.listmodelctr.length,
            itemBuilder: (BuildContext ctx, int idx) {
              final product = ecommercecontroller.listmodelctr[idx];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(product: product));
                  print(product.category);
                  print('su');
                },
                child: buildcard(
                    mediaHeight: mediaheight,
                    produk: product),
              );
            },
          ),
        ],

      ),
    );
  }
}
