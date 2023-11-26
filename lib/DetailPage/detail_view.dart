
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/Wishlist/WishlistController.dart';
import 'package:pas_kelas11/data,method,dll/EcommerceListModel.dart';
import 'package:pas_kelas11/data,method,dll/allmethod.dart';
import 'package:pas_kelas11/data,method,dll/reusable_widgets.dart';
import '../data,method,dll/ProductController.dart';
import 'detail_controller.dart';
import 'package:pas_kelas11/Cart/cart_controller.dart';


class DetailPage extends StatelessWidget {
  final DetailController controller = Get.put(DetailController());
  Ecommercelistmodel product;
  final ecommercecontroller = Get.put(ControllerProduct());
  final wishcontroller = Get.put(ControllerWishlist());
  final cartcontroller = Get.put(CartController());

  late final Category? category;


  final List<String> imageAssets = [
    'asset/asset1.jpg',
    'asset/asset1.jpg',
    'asset/asset1.jpg',

  ];
  DetailPage({Key? key, required this.product, this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(product);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 1300,
          child: Column(
            children: [
              SizedBox(height: mediaheight * 0.05,),

              Container(
                height: mediaheight * 0.45,
                child: Stack(
                  children: [
                    Image.network(
                      product.image
                    ),

                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(text: product.title ?? 'No Data', color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold, height: 0),
                            Spacer(),
                            Container(
                              height: 0,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 8),
                                  CustomText(text: '1', color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, height: 0),
                                  SizedBox(width: 8),
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                        Row(
                          children: [
                            for (int i = 0; i < (product.rating?.rate.toInt() ?? 0); i++)
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                            SizedBox(width: 5),
                            textbuild(text: product.rating?.rate.toString() ?? "N/A", color: Colors.black, fontSize: 18, fontWeight: FontWeight.normal, height: 0),

                          ],
                        ),
                        SizedBox(height: mediaheight * 0.003),

                        (category == Category.MEN_S_CLOTHING || category == Category.WOMEN_S_CLOTHING)
                            ? showsize(controller)
                            : Text('hai'),

                        SizedBox(height: mediaheight * 0.05),
                        textbuild(text: 'Description', color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold, height: 0),
                        SizedBox(height: mediaheight * 0.009),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textbuild(text: product.description ?? 'No Description', color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal, height: 0)

                          ],
                        ),
                        SizedBox(height: 40),


                          ],
                        ),

                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
bottomNavigationBar: BottomAppBar(
  child: Container(
    child : Align(
      alignment:Alignment.centerLeft,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              textbuild(text: 'Price Each Item', color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w200, height: 0),
              textbuild(text:  '\$${product.price.toString()}', color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold, height: 0),

            ],
          ),
          Spacer(),
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
            ),
            child: GestureDetector(
              onTap: () {
                cartcontroller.addToCart(context, product);
                cartcontroller.updateRefreshFlag();
              },
              child: Icon(
                Icons.shopping_bag,
                color: Colors.white,  // Icon color
              ),
            ),
          ),
          SizedBox(width:width * 0.01 ,),
          Container(
            height: 50,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Icon(Icons.star,color: Colors.white,),
                SizedBox(width: 9,),
                GestureDetector(
                  onTap: () {
                    wishcontroller.add(context,product);
                    wishcontroller.updateRefreshFlag();
                  },
                  child: textbuild(
                    text: 'Add To Wishlist', color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, height: 0,

                  ),
                )

              ],
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


