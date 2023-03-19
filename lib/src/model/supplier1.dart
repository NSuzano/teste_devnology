class SupplierBR {
  String nome;
  String descricao;
  String categoria;
  String imagem;
  double preco;
  String material;
  String departamento;
  int id;
  String name;

  SupplierBR(
      {this.nome,
      this.descricao,
      this.categoria,
      this.imagem,
      this.preco,
      this.material,
      this.departamento,
      this.id,
      this.name});

  SupplierBR.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    descricao = json['descricao'];
    categoria = json['categoria'];
    imagem = json['imagem'];
    preco = double.parse(json['preco']);
    material = json['material'];
    departamento = json['departamento'];
    id = int.parse(json['id']);
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['descricao'] = this.descricao;
    data['categoria'] = this.categoria;
    data['imagem'] = this.imagem;
    data['preco'] = this.preco;
    data['material'] = this.material;
    data['departamento'] = this.departamento;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
