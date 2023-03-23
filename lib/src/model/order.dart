import 'package:flutter_ecommerce_app/src/model/product.dart';

class Order {
  int id;
  Product product;
  int quant;
  double total;

  Order(
    this.id,
    this.product,
    this.quant,
    this.total,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product'] = this.product;
    data['quant'] = this.quant;
    data['total'] = this.total;
    return data;
  }
}
