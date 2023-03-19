import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProduct(SupplierBR supplier) {
    if (_products.containsKey(supplier)) {
      _products[supplier] += 1;
    } else {
      _products[supplier] = 1;
    }

    Get.snackbar("Produto Adicionado",
        "Você adicionou o produto ${supplier.nome} ao carrinho",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 1));
  }

  void removeProduct(SupplierBR supplier) {
    if (_products.containsKey(supplier) && _products[supplier] == 1) {
      _products.removeWhere((key, value) => key == supplier);
    } else {
      _products[supplier] -= 1;
    }
  }

  get products => _products;

  get productSubtotal => _products.entries
      .map((product) => product.key.preco * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.preco * product.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
