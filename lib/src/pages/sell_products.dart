import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/controller/bo.dart';
import 'package:flutter_ecommerce_app/src/controller/http.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../model/clients.dart';
import '../themes/light_color.dart';

class SellProducts extends StatefulWidget {
  @override
  State<SellProducts> createState() => _SellProductsState();
}

class _SellProductsState extends State<SellProducts> {
  Http http = Http();
  var data = Get.arguments;

  List listOrder = [];

  Future getOrder() async {
    listOrder = await http.getOrderClient(data);

    print("LISTA$listOrder");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Produtos Comprados",
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 100, // Set this height
        actions: [Image.asset("assets/user.png")],
        backgroundColor: Color(0xfffbfbfb),
        elevation: 0,
        iconTheme: IconThemeData(color: LightColor.iconColor),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: _buildList(context),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return FutureBuilder(
      future: getOrder(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              itemCount: listOrder.length,
              itemBuilder: (context, index) {
                if (listOrder.length == 0) {
                  return Container();
                }
                return ExpansionTile(
                  leading: CircleAvatar(
                      radius: 20.0,
                      child: Image.network(
                        listOrder[index]['imagem_supplier_br'],
                      )),
                  title: Text("${listOrder[index]['nome_supplier_br']}"),
                  subtitle:
                      Text("\$ ${listOrder[index]['preco_supplier_br']},00"),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Column(
                        children: [
                          Text(
                            "Descrição: ${listOrder[index]['descricao_supplier_br']}",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Departamento: ${listOrder[index]['departamento_supplier_br']}",
                            textAlign: TextAlign.end,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Material: ${listOrder[index]['material_supplier_br']}",
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Quantidade: ${listOrder[index]['quant_order_details']}",
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    )
                  ],
                );
              });
        }
      },
    );
  }
}
