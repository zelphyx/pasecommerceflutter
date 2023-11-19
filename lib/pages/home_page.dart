
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/DetailPage/detail_view.dart';
import 'package:pas_kelas11/Profile/profile.dart';
import 'package:pas_kelas11/data,method,dll/allmethod.dart';
import 'package:pas_kelas11/data,method,dll/reusable_widgets.dart';
import 'package:pas_kelas11/data,method,dll/ProductController.dart';
import 'package:pas_kelas11/pages/allproducts.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchbarcontroller = TextEditingController();
  final ecommercecontroller = Get.put(ControllerProduct());

  @override
  Widget build(BuildContext context ) {
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    return Scaffold(

      drawer: NavDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Open shopping cart',
            onPressed: () {
                  Get.to(profile());
            },
          ),
        ],
      ),
      body: Obx(() => ecommercecontroller.isLoading.value
        ? Center(child: CircularProgressIndicator())
      :ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: mediaheight * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Column(
                  children: [
                    Text("Welcome", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, height: mediawidth * 0.002, fontFamily: 'LibreCaslonText',),),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: textbuild(text: "Our Fashion App", color: Colors.black54, fontSize: 13, fontWeight: FontWeight.w600, height: mediawidth * 0.007,),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaheight * 0.006,),
              buildsearchbar(ecommercecontroller),
              SizedBox(height: mediaheight * 0.05,),
              diskonlist(ecommercecontroller),
              Column(
                children: [
                  SizedBox(height: mediaheight * 0.03),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textbuild(text: 'Categories', color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, height: 0),
                        InkWell(
                            child: textbuild(text: 'View All Products', color: Colors.blue, fontSize: 12, fontWeight: FontWeight.normal, height: 0),
                          onTap: (){
                            Get.to(() => allproducts());
                          }

                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: mediaheight * 0.01),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    child: buildCategoryButtons(ecommercecontroller)
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8.0,
                        mainAxisSpacing: 8.0,
                      ),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: ecommercecontroller.filteredProducts.length,
                    itemBuilder: (BuildContext ctx, int idx) {
                      final product = ecommercecontroller.filteredProducts[idx];
                      return GestureDetector(
                        onTap: () {
                            Get.to(() => DetailPage(product: product));
                            print(product.category);
                            print('tes');
                        },
                        child: buildcard(
                          mediaHeight: mediaheight,
                          produk: product),
                      );
                      },
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      )
    );
  }
}

