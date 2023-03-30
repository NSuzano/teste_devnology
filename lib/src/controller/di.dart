import 'package:flutter_ecommerce_app/src/controller/cart_controller.dart';
import 'package:get/get.dart';

class Di {
  Future<void> init() async {
    Get.put(CartController());
  }
}
