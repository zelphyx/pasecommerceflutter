import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/Cart/cart_view.dart';
import 'package:pas_kelas11/data,method,dll/EcommerceListModel.dart';
import 'cart_controller.dart';

class cartt extends StatefulWidget {
  final CartController cartcontroller = Get.put(CartController());
  final Ecommercelistmodel cartitem;

  cartt({
    Key? key,
    required this.cartitem,
  }) : super(key: key);

  @override
  _carttState createState() => _carttState();
}

class _carttState extends State<cartt> {
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartItem = widget.cartitem;

    return Container(
      width: size.width,
      height: size.height * 0.15,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black, width: 3)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.width * 0.27,
              width: size.width * 0.27,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(cartItem.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(width: 10),
            Container(
              width: size.width * 0.45,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.01),
                  Text(
                    cuttext(cartItem.title, 3),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    '\$ ${(cartItem.price * counter).toString()}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(

                children: [
                  SizedBox(height: size.height * 0.035,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (counter > 1) {
                              counter--;
                            }
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '$counter',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            counter++;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(Icons.add),
                        ),
                      ),
                      ]
                  ),
                  SizedBox(width: 10),
                      GestureDetector(
                        onTap: () => widget.cartcontroller.removeFromCart(context, cartItem.id, cartItem.title),
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                    ],

              ),
            ),
          ],
        ),
      ),
    );
  }
}

String cuttext(String text, int maxWords) {
  if (text == null || text.isEmpty) {
    return 'No Data';
  }

  List<String> words = text.split(' ');
  if (words.length <= maxWords) {
    return text;
  }

  return '${words.take(maxWords).join(' ')}...';
}
