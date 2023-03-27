import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/model/supplier1.dart';

class OrderBR {
  int id_clients;
  int quant_order_details;
  int id_supplier_br;
  double total_order_details;

  OrderBR(
    this.id_clients,
    this.quant_order_details,
    this.id_supplier_br,
    this.total_order_details,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_clients'] = this.id_clients;
    data['quant_order_details'] = this.quant_order_details;
    data['id_supplier_br'] = this.id_supplier_br;
    data['total_order_details'] = this.total_order_details;
    return data;
  }
}
