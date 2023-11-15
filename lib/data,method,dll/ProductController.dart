import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'EcommerceListModel.dart';


class ControllerProduct extends GetxController{
  SharedPreferences? prefs;

RxList<Ecommercelistmodel>listmodelctr =
<Ecommercelistmodel>[].obs;
  RxBool isLoading = true.obs;





  RxString sessionUsername = "".obs;
  void loadSession() async{
    prefs = await SharedPreferences.getInstance();
    sessionUsername.value = prefs!.getString("username") ?? "no data";
    print("get username "+ sessionUsername.value.toString());
  }

  void loadData()async {

    final response =await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if(response.statusCode == 200){
      listmodelctr.value = ecommercelistmodelFromJson(response.body);
      print("halo: ${listmodelctr.value}");
    } else{
    print("status code : " + response.statusCode.toString());
    }

    isLoading.value = false;

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSession();
    loadData();
  }

}