import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pas_kelas11/data,method,dll/reusable_widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pas_kelas11/data,method,dll/ProductController.dart';

class HomePage extends StatelessWidget {
  final TextEditingController searchbarcontroller = TextEditingController();
  final ecommercecontroller = Get.put(ControllerProduct());

  @override
  Widget build(BuildContext context) {
    double mediaheight = MediaQuery.of(context).size.height;
    double mediawidth = MediaQuery.of(context).size.width;
    bool isValidUrl(String url) {
      Uri? uri = Uri.tryParse(url);
      return (uri != null && uri.isAbsolute);
    }
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Open shopping cart',
            onPressed: () {
              // handle the press
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
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: mediawidth * 0.002,
                        fontFamily: 'LibreCaslonText',
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: textbuild(
                        text: "Our Fashion App",
                        color: Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: mediawidth * 0.007,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: mediaheight * 0.006,),
              Container(
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
              ),
              SizedBox(height: mediaheight * 0.05,),
              Container(
                padding: EdgeInsets.only(left: 5),
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    builddiskon(discountPercentage: "70%", itemDescription: " + Free 1 Merch", couponCode: "FSREACTION", buttonText: "Get Now"),
                    builddiskon(discountPercentage: "30%", itemDescription: " + Free Merch", couponCode: "FIRSTUSER", buttonText: "Get Now"),
                    builddiskon(discountPercentage: "20%", itemDescription: " + Free Shipping", couponCode: "SHIPDAY", buttonText: "Get Now")
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SizedBox(height: mediaheight * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        textbuild(text: 'Categories', color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold, height: 0),
                        textbuild(text: 'View All', color: Colors.blue, fontSize: 12, fontWeight: FontWeight.normal, height: 0),
                      ],
                    ),
                    SizedBox(height: mediaheight * 0.01),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: ClampingScrollPhysics(),
                      child: Row(
                        children: [
                          customcategorybutton(text: "Clothes",onPressed: (){

                          },),
                          customcategorybutton(text: "Electronics",onPressed: (){

                          },),
                          customcategorybutton(text: "Furniture",onPressed: (){

                          },),
                          customcategorybutton(text: "Shoes",onPressed: (){

                          },),
                          customcategorybutton(text: "Miscellaneous",onPressed: (){

                          },),
                        ],
                      ),

                    ),
                    Container(
                      height: 500,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                        ),
                        itemCount: ecommercecontroller.listmodelctr.length,
                        itemBuilder: (BuildContext ctx, int idx) {
                          final product = ecommercecontroller.listmodelctr[idx];
                          return buildcard(mediaHeight: mediaheight, imageUrl: product.image, title: product.title,price: product.price,);



                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      )
    );
  }
}

class NavDrawer extends StatelessWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<void> signout() async {
    await auth.signOut();
    await googleSignIn.signOut();
    Get.toNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('asset/asset1.jpg'),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () async {
              await signout();
            },
          ),
        ],
      ),
    );
  }
}
