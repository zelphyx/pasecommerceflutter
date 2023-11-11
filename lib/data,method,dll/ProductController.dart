import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


class ControllerProduct extends GetxController{
  SharedPreferences? prefs;

  RxString sessionUsername = "".obs;
  void loadSession() async{
    prefs = await SharedPreferences.getInstance();
    sessionUsername.value = prefs!.getString("username") ?? "no data";
    print("get username "+ sessionUsername.value.toString());
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSession();
  }

}