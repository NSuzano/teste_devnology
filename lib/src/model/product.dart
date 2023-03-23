class Product {
  int _id;
  String _nome;
  // String category ;
  // String image ;
  double _preco;
  // bool isliked ;
  // bool isSelected ;
  // Product({this.id,this.name, this.category, this.price, this.isliked,this.isSelected = false,this.image});

  set id(int id) {
    _id = id;
  }

  set nome(String nome) {
    _nome = nome;
  }

  set preco(double preco) {
    _preco = preco;
  }

  int get id {
    return _id;
  }

  String get nome {
    return _nome;
  }

  double get preco {
    return _preco;
  }

  Product(this._id, this._nome, this._preco);

  toJson() => {'id': id, 'nome': nome, 'preco': preco};

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
        json['id'] as int, json['nome'] as String, json['preco'] as double);
  }
}
