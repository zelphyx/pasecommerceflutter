import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/allmethod.dart';
import '../DetailPage/detail_view.dart';
import '../data,method,dll./reusable_widgets.dart';
import '../data,method,dll/ProductController.dart';

class allproducts extends StatelessWidget {
  final ecommercecontroller = Get.put(ControllerProduct());


  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        toolbarHeight: 56,
        title: textbuild(text: 'Our Products', color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold, height: 0),
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
                  print('a');
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
