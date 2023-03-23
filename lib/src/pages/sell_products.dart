import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controller/bo.dart';
import 'package:flutter_ecommerce_app/controller/http.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:provider/provider.dart';

class SellProducts extends StatefulWidget {
  @override
  State<SellProducts> createState() => _SellProductsState();
}

class _SellProductsState extends State<SellProducts> {
  List<Product> products = [];
  Http http = Http();

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      setState(() {
        products = Provider.of<List<Product>>(context);
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Total Vendas",
          style: TextStyle(color: Colors.black),
        ),
        toolbarHeight: 100, // Set this height
        actions: [
          Image.asset("assets/user.png")
          // Container(
          //   height: 120.0,
          //   width: 120.0,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(14),
          //     image: DecorationImage(
          //       image: AssetImage('assets/user.png'),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // )
          // Container(
          //     decoration: BoxDecoration(
          //       border: Border.all(width: 5),
          //       borderRadius: BorderRadius.circular(20), //<-- SEE HERE
          //     ),
          //     child: Image.asset("assets/user.png")),
        ],
        backgroundColor: Color(0xfffbfbfb),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
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
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          products.sort((a, b) => a.id.compareTo(b.id));
          return ExpansionTile(
            leading: CircleAvatar(
              radius: 20.0,
              child: Text(
                "${products[index].id}",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            title: Text("${products[index].nome}"),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    raisedButton('Update', fontSize: 15.0),
                    raisedButton('Delete', fontSize: 15.0),
                  ],
                ),
              )
            ],
          );
        });
  }
}
