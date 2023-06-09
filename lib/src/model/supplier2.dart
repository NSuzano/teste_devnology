class SupplierEU {
  bool hasDiscount;
  String name;
  List<String> gallery;
  String description;
  double price;
  double discountValue;
  Details details;
  int id;

  SupplierEU(
      {this.hasDiscount,
      this.name,
      this.gallery,
      this.description,
      this.price,
      this.discountValue,
      this.details,
      this.id});

  SupplierEU.fromJson(Map<String, dynamic> json) {
    hasDiscount = json['hasDiscount'];
    name = json['name'];
    gallery = json['gallery'].cast<String>();
    description = json['description'];
    price = double.parse(json['price']);
    discountValue = double.parse(json['discountValue']);
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
    id = int.parse(json['id']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasDiscount'] = this.hasDiscount;
    data['name'] = this.name;
    data['gallery'] = this.gallery;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discountValue'] = this.discountValue;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    data['id'] = this.id;
    return data;
  }
}

class Details {
  String adjective;
  String material;

  Details({this.adjective, this.material});

  Details.fromJson(Map<String, dynamic> json) {
    adjective = json['adjective'];
    material = json['material'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adjective'] = this.adjective;
    data['material'] = this.material;
    return data;
  }
}
