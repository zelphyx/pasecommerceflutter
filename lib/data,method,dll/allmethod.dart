import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_kelas11/Cart/cart_view.dart';
import 'package:pas_kelas11/DetailPage/detail_controller.dart';
import 'package:pas_kelas11/pages/allproducts.dart';
import 'package:pas_kelas11/pages/home_page.dart';
import 'package:pas_kelas11/pages/landing.dart';
import 'package:pas_kelas11/Profile/profile.dart';
import 'package:pas_kelas11/Wishlist/wishlist.dart';
import 'EcommerceListModel.dart';
import 'package:pas_kelas11/data,method,dll/reusable_widgets.dart';
import 'package:pas_kelas11/data,method,dll/ProductController.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


//Search Bar
Container buildsearchbar(ControllerProduct ecommerceController){
  TextEditingController? searchbarcontroller = TextEditingController();
  final ecommercecontroller = Get.put(ControllerProduct());
  return Container(
    margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(150),
      border: Border.all(
        color: Color(0xFFECEFFB),
        width: 2,
      ),
    ),
    height: 43,
    child: TextField(
      controller: searchbarcontroller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        border: InputBorder.none,
        contentPadding: EdgeInsets.only( bottom: 10, left: 10),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black54,
        ),
      ),
    ),
  );
}

//Category
Row buildCategoryButtons(ControllerProduct ecommerceController) {
  final ecommercecontroller = Get.put(ControllerProduct());
  return Row(
    children: [
      customcategorybutton(
        text: "Men's Clothes",
        onPressed: () {
          ecommercecontroller.filterProductsByCategory(Category.MEN_S_CLOTHING);
          print("Filtered Product count: ${ecommercecontroller.filteredProducts.length}");
        },
      ),
      customcategorybutton(
        text: "Women's Clothes",
        onPressed: () {
          ecommercecontroller.filterProductsByCategory(Category.WOMEN_S_CLOTHING);
          print("Filtered Product count: ${ecommercecontroller.filteredProducts.length}");
        },
      ),
      customcategorybutton(
        text: "Electronics",
        onPressed: () {
          ecommercecontroller.filterProductsByCategory(Category.ELECTRONICS);
          print("Filtered Product count: ${ecommercecontroller.filteredProducts.length}");
        },
      ),
      customcategorybutton(
        text: "Jewellery",
        onPressed: () {
          ecommercecontroller.filterProductsByCategory(Category.JEWELERY);
          print("Filtered Product count: ${ecommercecontroller.filteredProducts.length}");
        },
      ),
    ],
  );
}


//Navigation bar
Container buildnavbar(ControllerProduct ecommerceController) {
  return Container(
    height: 70,
    color: Colors.black,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GNav(
        backgroundColor: Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.grey.shade800,
        gap: 8,
        onTabChange: (index) {
          // Navigate to the corresponding page based on the selected index
          switch (index) {
            case 0:
              Get.toNamed('/homepage');
              break;
            case 1:
              Get.to(() => wishlistpage());
              break;
            case 2:
              Get.toNamed('/profile');
              break;
          }
        },
        tabs: [
          GButton(icon: Icons.home, text: "Home"),
          GButton(icon: Icons.star, text: "Wishlist"),
          GButton(icon: Icons.person, text: "Profile"),
        ],
      ),
    ),
  );
}



//Drawer
class NavDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;

  Future<void> signout() async {
    await auth.signOut();
    await googleSignIn.signOut();
    Get.toNamed('/login');
    _currentUser = null;
    googleSignIn.disconnect();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: textbuild(text: 'Shopzo', color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold, height: 0),
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('asset/logozzz.png'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            onTap: () {
              Get.to(HomePage());
            },
          ),
          ListTile(
            leading: Icon(Icons.card_travel_rounded),
            title: Text('All Products'),
            onTap: () {
              Get.to(allproducts());
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Wishlist'),
            onTap: () {
              Get.to(wishlistpage());
            },
          ),ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Cart'),
            onTap: () {
              Get.to(Cart());
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Get.to(Profile());
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.shopping_bag),
          //   title: Text('Cart'),
          //   onTap: () {
          //     Get.to(Cart());
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              await signout();
              Get.to(landing());
            },
          ),
        ],
      ),
    );
  }
}

//Diskon List
Container diskonlist(ControllerProduct ecommercecontroller){
  return  Container(
    padding: EdgeInsets.only(left: 5),
    height: 200,
    child: ListView(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      children: [
        builddiskon(discountPercentage: "70%",
            itemDescription: " + Free 1 Merch",
            couponCode: "FSREACTION",
            buttonText: "Get Now",onPressed: () {
            Get.to(() => allproducts());
            }),
        builddiskon(discountPercentage: "30%", itemDescription: " + Free Merch", couponCode: "FIRSTUSER", buttonText: "Get Now",onPressed: () {
          Get.to(() => allproducts());
        }),
        builddiskon(discountPercentage: "20%", itemDescription: " + Free Shipping", couponCode: "SHIPDAY", buttonText: "Get Now",onPressed: () {
          Get.to(() => allproducts());
        })
      ],
    ),
  );
}

Widget showsize(DetailController controller) {
  return Column(
    children: [
      textbuild(text: "Size", color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold, height: 0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var text in ['S', 'M', 'L', 'XL', 'XXL'])
            Container(
              width: 57,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.grey,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: textbuild(text: text, color: Colors.grey, fontSize: 12, fontWeight: FontWeight.normal, height: 0),
              ),
            ),
        ],
      ),
    ],
  );
}


