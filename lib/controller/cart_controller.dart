import 'package:flutter/material.dart';
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
        "Você adicionou o produto ${supplier.nome_supplier_br} ao carrinho",
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(50.0),
        backgroundColor: Colors.grey[300]);
  }

  void removeProduct(SupplierBR supplier) {
    if (_products.containsKey(supplier) && _products[supplier] == 1) {
      _products.removeWhere((key, value) => key == supplier);
    } else {
      _products[supplier] -= 1;
    }
  }

  get products => _products;

  void zeroProduct() {
    _products = {}.obs;
  }

  get productSubtotal => _products.entries
      .map((product) => product.key.preco_supplier_br * product.value)
      .toList();

  get total => _products.entries.isNotEmpty
      ? _products.entries
          .map((product) => product.key.preco_supplier_br * product.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2)
      : _products.entries.map((product) => 0.00 * 0.00);
}
