import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_ecommerce_app/src/controller/bo.dart';

import '../model/clients.dart';
import '../model/order_br.dart';

class Http {
  // localhost || 10.0.2.2 (mysql) || 192.168.1.165 (home) || 10.192.82.178 (eduroam) || 10.10.10.47 (PIA despscho Juanjo)
  final url = 'http://192.168.1.5:8000/';
  final url2 = 'http://localhost:8000/';
  final products = 'products/';
  final orderurl = 'order/';
  final supplierbr = 'productbr/';
  final suppliereu = 'producteu/';
  final clients = 'clients/';
  final clientsid = 'clientsid/';
  final clientsinfo = 'clientsinfo/';
  final lastproducts = 'lastproducts/';
  final headers = {'Content-Type': 'application/json'};
  final encoding = Encoding.getByName('utf-8');

  Http();

  makeGetLastProductsRequest() async {
    http.Response response =
        await http.get(Uri.parse('$url$lastproducts'), headers: headers);
    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');

    final json = jsonDecode(response.body);

    return json[0]['id_supplier_br'];
    ;
  }

  makeProductPostRequest(SupplierBR product) async {
    var body = json.encode(product.toJson());
    http.Response response = await http.post(Uri.parse('$url$supplierbr'),
        headers: headers, body: body, encoding: encoding);

    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }

  checkUserRequest(String email, String senha) async {
    http.Response response = await http.get(
        Uri.parse('$url$clients?email_clients=$email&senha_clients=$senha'),
        headers: headers);

    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');

    final json = jsonDecode(response.body);

    print(json);

    if (json.length == 0) {
      return 0;
    } else {
      return json[0]['id_clients'];
    }
  }

  getOrderClient(int id_clients) async {
    http.Response response = await http.get(
        Uri.parse('$url$clientsid?id_clients=$id_clients'),
        headers: headers);

    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');

    final json = jsonDecode(response.body);

    print(json);

    if (json.length == 0) {
      return [];
    } else {
      return json;
    }
  }

  getInfoClients(int id_clients) async {
    http.Response response = await http.get(
        Uri.parse('$url$clientsinfo?id_clients=$id_clients'),
        headers: headers);

    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');

    final json = jsonDecode(response.body);

    print(json);
    return json;
  }

  postClientRequest(Clients client) async {
    String body = json.encode(client.toJson());
    http.Response response = await http.post(Uri.parse('$url$clients'),
        headers: headers, body: body, encoding: encoding);

    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }

  makeOrderPostRequest(int idClient, int quant, int supbr, double total) async {
    // Map teste = {
    //   'nome_product': 'teste',
    //   'preco_product': 12.1,
    //   'descricao_product': 'teste desc',
    //   'categoria_produto': 'teste cat',
    //   'imagem_product': 'http:teste',
    //   'material_produto': 'material',
    //   'departamento_produto': 'dep'
    // };

    // Map orders = {
    //   "total_order": 127.0,
    //   "quant_order": 5,
    //   "id_client": 1,
    //   "id_supplierbr": 1,
    // };

    int idLastProduct = await makeGetLastProductsRequest();

    OrderBR order = OrderBR(idClient, quant, idLastProduct, total);

    String body = json.encode(order.toJson());
    http.Response response = await http.post(Uri.parse('$url$orderurl'),
        headers: headers, body: body, encoding: encoding);

    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }
}
