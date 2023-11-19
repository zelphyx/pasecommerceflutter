import 'package:get/get.dart';
import 'WishlistController.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ControllerWishlist());
  }
}