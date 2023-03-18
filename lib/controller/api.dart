import 'dart:convert';

import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
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
}
