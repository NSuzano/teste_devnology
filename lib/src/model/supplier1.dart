class SupplierBR {
  String nome_supplier_br;
  String descricao_supplier_br;
  String categoria_supplier_br;
  String imagem_supplier_br;
  double preco_supplier_br;
  String material_supplier_br;
  String departamento_supplier_br;

  SupplierBR({
    this.nome_supplier_br,
    this.descricao_supplier_br,
    this.categoria_supplier_br,
    this.imagem_supplier_br,
    this.preco_supplier_br,
    this.material_supplier_br,
    this.departamento_supplier_br,
  });

  SupplierBR.fromJson(Map<String, dynamic> json) {
    nome_supplier_br = json['nome'];
    descricao_supplier_br = json['descricao'];
    categoria_supplier_br = json['categoria'];
    imagem_supplier_br = json['imagem'];
    preco_supplier_br = double.parse(json['preco']);
    material_supplier_br = json['material'];
    departamento_supplier_br = json['departamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome_supplier_br'] = this.nome_supplier_br;
    data['descricao_supplier_br'] = this.descricao_supplier_br;
    data['categoria_supplier_br'] = this.categoria_supplier_br;
    data['imagem_supplier_br'] = this.imagem_supplier_br;
    data['preco_supplier_br'] = this.preco_supplier_br;
    data['material_supplier_br'] = this.material_supplier_br;
    data['departamento_supplier_br'] = this.departamento_supplier_br;
    return data;
  }
}
