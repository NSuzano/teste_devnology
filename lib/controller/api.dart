import 'dart:convert';

import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
import 'package:flutter_ecommerce_app/src/model/supplier2.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<List<SupplierBR>> produtosBrLista() async {
    List<String> produtos = [];

    Uri url = Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => SupplierBR.fromJson(json)).toList();
    } else {
      throw Exception('Erro não foi possível carregar a lista');
    }
  }

  Future<List<SupplierEU>> produtosEuLista() async {
    List<String> produtos = [];

    Uri url = Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((json) => SupplierEU.fromJson(json)).toList();
    } else {
      throw Exception('Erro não foi possível carregar a lista');
    }
  }

  Future<List<SupplierBR>> getProductSearch({String search}) async {
    SupplierBR sup = SupplierBR();
    List<SupplierBR> _result;

    Uri url = Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider?nome=$search');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      List<SupplierBR> users = (json.decode(response.body) as List)
          .map((data) => SupplierBR.fromJson(data))
          .toList();

      return users;
    } else {
      throw Exception('Erro não foi possível carregar a procura de produtos');
    }
  }
}
