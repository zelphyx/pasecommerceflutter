import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/data,method,dll/EcommerceListModel.dart';
import 'WishlistController.dart';



class wishlistcard extends StatefulWidget {
  final ControllerWishlist wishlistcontroller = Get.put(ControllerWishlist());
  final Ecommercelistmodel wishlistitem;

  wishlistcard({
    Key? key,
    required this.wishlistitem,
  }) : super(key: key);

  @override
  _CardCartState createState() => _CardCartState();
}

class _CardCartState extends State<wishlistcard> {
  int counter = 1; // Initialize counter for quantity

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartItem = widget.wishlistitem;

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
                    '\$ ${cartItem.price.toString()}',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => widget.wishlistcontroller.remove(context, cartItem.id, cartItem.title),
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.delete),
                  ),
                ),
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