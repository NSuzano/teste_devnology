import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/controller/bo.dart';

import '../src/model/order.dart';

class Http {
  // localhost || 10.0.2.2 (mysql) || 192.168.1.165 (home) || 10.192.82.178 (eduroam) || 10.10.10.47 (PIA despscho Juanjo)
  final url = 'http://192.168.1.6:8000/';
  final products = 'products/';
  final headers = {'Content-Type': 'application/json'};
  final encoding = Encoding.getByName('utf-8');

  Http();

  Future<List<Product>> getProducts() async {
    print(url);
    print(products);
    http.Response response =
        await http.get(Uri.parse('$url$products'), headers: headers);
    // List data = jsonDecode(jsonEncode(response.body));
    // print(data[0]);
    List<Product> result = new List<Product>.from(json
        .decode(response.body)
        .map((jsonObject) => new Product.fromJson(jsonObject)));
    result.sort((a, b) => a.id.compareTo(b.id));
    print('${getstatusCode(response.statusCode)}');
    return result;
  }

  makeUserDeleteRequest(Product product) async {
    http.Response response = await http
        .delete(Uri.parse('$url$products${product.id}'), headers: headers);
    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }

  makeUserPutRequest(Product product) async {
    String body = json.encode(product.toJson());
    http.Response response = await http.put(
        Uri.parse('$url$product${product.id}'),
        headers: headers,
        body: body,
        encoding: encoding);
    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }

  makeUserPostRequest(List<Order> product) async {
    String body = json.encode(product);
    http.Response response = await http.post(Uri.parse('$url$product'),
        headers: headers, body: body, encoding: encoding);
    print(response.body);
    print(
        'Estado da Resposta ${response.statusCode} => ${getstatusCode(response.statusCode)}');
  }
}
