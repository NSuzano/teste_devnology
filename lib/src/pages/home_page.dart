import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controller/api.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
import 'package:flutter_ecommerce_app/src/pages/search_page.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/widgets/product_card.dart';
import 'package:flutter_ecommerce_app/src/widgets/product_icon.dart';
import 'package:flutter_ecommerce_app/src/widgets/extentions.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Api api = Api();
  Future<List<SupplierBR>> produtosBr;

  Widget _icon(IconData icon, {Color color = LightColor.iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Theme.of(context).backgroundColor,
          boxShadow: AppTheme.shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  @override
  void initState() {
    super.initState();
    produtosBr = api.produtosBrLista();
  }

  // Widget _categoryWidget() {
  //   return Container(
  //     margin: EdgeInsets.symmetric(vertical: 10),
  //     width: AppTheme.fullWidth(context),
  //     height: 80,
  //     child: FutureBuilder(
  //         future: produtosBr,
  //       builder: (context, snapshot){
  //         return  ListView.builder(
  //           scrollDirection: Axis.horizontal,
  //           itemCount: snapshot.data.length,
  //           itemBuilder: (context, index) {
  //           List supplierBr = snapshot.data[index];

  //             return ListView(
  //               children: ,
  //             )
  //         });
  //       }),
  //     // child: ListView(
  //     //   scrollDirection: Axis.horizontal,
  //       // children: AppData.categoryList
  //       //     .map(
  //       //       (category) => ProductIcon(
  //       //         model: category,
  //       //         onSelected: (model) {
  //       //           setState(() {
  //       //             AppData.categoryList.forEach((item) {
  //       //               item.isSelected = false;
  //       //             });
  //       //             model.isSelected = true;
  //       //           });
  //       //         },
  //       //       ),
  //       //     )
  //       //     .toList(),
  //     // ),
  //   );
  // }

  Widget _productWidget() {
    return Container(
      width: AppTheme.fullWidth(context),
      height: AppTheme.fullWidth(context),
      child: FutureBuilder<List<SupplierBR>>(
          future: produtosBr,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 4 / 3,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 20),
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
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
      // child: GridView.builder(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 2,
      //         crossAxisSpacing: 16,
      //         childAspectRatio: .66),
      //     itemBuilder: itemBuilder),  //         mainAxisExtent: 16,

      // child: GridView(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 1,
      //       childAspectRatio: 4 / 3,
      //       mainAxisSpacing: 30,
      //       crossAxisSpacing: 20),
      //   padding: EdgeInsets.only(left: 20),
      //   scrollDirection: Axis.horizontal,
      //   children: AppData.productList
      //       .map(
      //         (product) => ProductCard(
      //           product: product,
      //           onSelected: (model) {
      //             setState(() {
      //               AppData.productList.forEach((item) {
      //                 item.isSelected = false;
      //               });
      //               model.isSelected = true;
      //             });
      //           },
      //         ),
      //       )
      //       .toList(),
      // ),
    );
  }

  Widget _search() {
    return Container(
      margin: AppTheme.padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: LightColor.lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                onTap: () {
                  showSearch(context: context, delegate: SearchPage());
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Procurar Produtos",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 210,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _search(),
            // _categoryWidget(),
            _productWidget(),
          ],
        ),
      ),
    );
  }
}
