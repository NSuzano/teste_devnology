class Clients {
  String nome_clients;
  String email_clients;
  String senha_clients;

  Clients(
    this.nome_clients,
    this.email_clients,
    this.senha_clients,
  );

  set setemail(String email) {
    email_clients = email;
  }

  get categoryName => nome_clients;
  get categoryIcon => email_clients;

  Clients.fromJson(Map<String, dynamic> json) {
    nome_clients = json['nome_clients'];
    email_clients = json['email_clients'];
    senha_clients = json['senha_clients'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome_clients'] = this.nome_clients;
    data['email_clients'] = this.email_clients;
    data['senha_clients'] = this.senha_clients;
    return data;
  }
}
