class OrderBR {
  int id_clients;
  int quant_order_details;
  int id_supplier_eu;
  double total_order_details;

  OrderBR(
    this.id_clients,
    this.quant_order_details,
    this.id_supplier_eu,
    this.total_order_details,
  );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_clients'] = this.id_clients;
    data['quant_order_details'] = this.quant_order_details;
    data['id_supplier_eu'] = this.id_supplier_eu;
    data['total_order_details'] = this.total_order_details;
    return data;
  }
}
