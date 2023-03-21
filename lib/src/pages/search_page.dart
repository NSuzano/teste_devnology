import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controller/api.dart';
import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
import 'package:get/get.dart';

import '../themes/theme.dart';

class SearchPage extends SearchDelegate {
  Api api = Api();
  SupplierBR search = SupplierBR();
  List<SupplierBR> list = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  Future<List<SupplierBR>> getProductsSearch(String product) async {
    list = await api.getProductSearch(search: product);

    return list;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return SingleChildScrollView(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: FutureBuilder<List<SupplierBR>>(
          future: getProductsSearch(query),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .66,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  SupplierBR supplierBr = snapshot.data[index];
                  return GestureDetector(
                    onTap: () =>
                        Get.to(ProductDetailPage(), arguments: supplierBr),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            supplierBr.imagem,
                          ),
                        ),
                        ListTile(
                          isThreeLine: true,

                          title: Text(supplierBr.nome),
                          subtitle: Text("\$" + "${supplierBr.preco}"),
                          // subtitle: Text(supplierBr.name),
                        ),
                      ],
                    ),
                  );
                },
              ); //
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return SizedBox(
                height: MediaQuery.of(context).size.height / 1.3,
                child: Center(child: const CircularProgressIndicator()));
          }),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(
      child: Text("Search"),
    );
  }
}
