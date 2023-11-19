import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'EcommerceListModel.dart';
import 'package:get/get_rx/get_rx.dart';



class ControllerProduct extends GetxController {
  SharedPreferences? prefs;

  Rx<Ecommercelistmodel?> selectedProduct = Rx<Ecommercelistmodel?>(null);
  RxList<Ecommercelistmodel> listmodelctr = <Ecommercelistmodel>[].obs;
  RxList<Ecommercelistmodel> filteredProducts = <Ecommercelistmodel>[].obs;

  RxBool isLoading = true.obs;

  RxString sessionUsername = "".obs;

  void loadData() async {
    final response =
    await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      listmodelctr.value = ecommercelistmodelFromJson(response.body);

      filteredProducts.assignAll(listmodelctr);
      print("halo: ${listmodelctr.length}");
    } else {
      print("status code : " + response.statusCode.toString());
    }
    isLoading.value = false;
  }


  Ecommercelistmodel? fetchProductDetailsById(int productId) {
    return listmodelctr.firstWhere(
          (product) => product.id == productId,
      orElse: () => Ecommercelistmodel(id: -1, title: 'Product Not Found', price: 0.0, image: ""),
    );
  }

  void filterProductsByCategory(Category category) {
    print("Filtering by category: $category");
    filteredProducts.assignAll(
        listmodelctr.where((product) => product.category == category));
    print("Filtered Product count: ${filteredProducts.length}");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadData();

    // Don't set selectedProduct here
  }
}
