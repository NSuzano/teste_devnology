import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/pages/shopping_cart_page.dart';
import 'package:flutter_ecommerce_app/src/widgets/cart_total.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShoppingCartPage(),
      ],
    );
  }
}
