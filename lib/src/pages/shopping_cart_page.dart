import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controller/cart_controller.dart';
import 'package:flutter_ecommerce_app/controller/http.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
import 'package:flutter_ecommerce_app/src/pages/home_page.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/widgets/cart_total.dart';
import 'package:flutter_ecommerce_app/src/widgets/title_text.dart';
import 'package:get/get.dart';

import '../model/order_br.dart';

class ShoppingCartPage extends StatelessWidget {
  final CartController controller = Get.find();
  final Product product = Product(1, "TESTETotal", 2.35);
  Http http = Http();
  var data = Get.arguments;

  ShoppingCartPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Container(
              child: SizedBox(
                height: 300,
                child: Scrollbar(
                  thickness: 10,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          controller: controller,
                          sup: controller.products.keys.toList()[index],
                          quant: controller.products.values.toList()[index],
                          index: index,
                        );
                      }),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            CartTotal(),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: LightColor.orange,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  List<SupplierBR> supListKey = [];
                  List<int> supListValue = [];
                  print(controller.products.value.length);
                  if (controller.products.value.length != 0 ||
                      controller.products.value.length != "") {
                    int i = 0;

                    for (i = 0; i < controller.products.value.length; i++) {
                      supListKey.add(controller.products.keys.toList()[i]);
                      supListValue.add(controller.products.values.toList()[i]);
                      print("Iteração: $i");
                      print(supListValue[i]);

                      http.makeProductPostRequest(supListKey[i]);

                      http.makeOrderPostRequest(
                          1, supListValue[i], double.parse(controller.total));
                    }

                    if (controller.products.value.length != 0) {
                      Get.snackbar(
                          "Pedido Concluído", "Você fez a compra dos produtos.",
                          snackPosition: SnackPosition.TOP,
                          duration: Duration(seconds: 1),
                          margin: EdgeInsets.all(50.0),
                          backgroundColor: Colors.grey[300]);

                      controller.zeroProduct();

                      Get.offAll(MainPage(), arguments: data);
                    }
                  }
                },
                child: Text(
                  "Comprar",
                  style: AppTheme.h3Style,
                ))
          ],
        ));
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final SupplierBR sup;
  final int quant;
  final int index;

  const CartProductCard(
      {Key key, this.controller, this.sup, this.quant, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      // child: _item(sup),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(sup.imagem_supplier_br),
          ),
          SizedBox(
            width: 20,
          ),
          Text(sup.nome_supplier_br),
          IconButton(
              onPressed: () {
                controller.removeProduct(sup);
              },
              icon: Icon(Icons.remove_circle_outline)),
          Text(quant.toString()),
          Flexible(
            child: IconButton(
                onPressed: () {
                  controller.addProduct(sup);
                },
                icon: Icon(Icons.add_circle_outline_outlined)),
          ),
        ],
      ),
    );
  }
}

// class ShoppingCartPage extends StatelessWidget {
//   Widget _cartItems() {
//     return Column(children: AppData.cartList.map((x) => _item(x)).toList());
//   }

Widget _item(SupplierBR model) {
  return Container(
    height: 80,
    child: Row(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1.2,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  height: 70,
                  width: 70,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: BoxDecoration(
                              color: LightColor.lightGrey,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: -20,
                bottom: -20,
                child: Image.network(model.imagem_supplier_br),
              )
            ],
          ),
        ),
        Expanded(
            child: ListTile(
                title: TitleText(
                  text: model.nome_supplier_br,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                subtitle: Row(
                  children: <Widget>[
                    TitleText(
                      text: '\$ ',
                      color: LightColor.red,
                      fontSize: 12,
                    ),
                    TitleText(
                      text: model.preco_supplier_br.toString(),
                      fontSize: 14,
                    ),
                  ],
                ),
                trailing: Container(
                  width: 35,
                  height: 35,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: LightColor.lightGrey.withAlpha(150),
                      borderRadius: BorderRadius.circular(10)),
                  child: TitleText(
                    text: 'x${model.nome_supplier_br}',
                    fontSize: 12,
                  ),
                )))
      ],
    ),
  );
}

// Widget _price(SupplierBR model) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: <Widget>[
//       TitleText(
//         text: '${AppData.cartList.length} Items',
//         color: LightColor.grey,
//         fontSize: 14,
//         fontWeight: FontWeight.w500,
//       ),
//       TitleText(
//         text: '\$${model.preco}',
//         fontSize: 18,
//       ),
//     ],
//   );
// }

//   Widget _submitButton(BuildContext context) {
//     return TextButton(
//       onPressed: () {},
//       style: ButtonStyle(
//         shape: MaterialStateProperty.all(
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//         ),
//         backgroundColor: MaterialStateProperty.all<Color>(LightColor.orange),
//       ),
//       child: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(vertical: 4),
//         width: AppTheme.fullWidth(context) * .75,
//         child: TitleText(
//           text: 'Next',
//           color: LightColor.background,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }

//   double getPrice() {
//     double price = 0;
//     AppData.cartList.forEach((x) {
//       price += x.price * x.id;
//     });
//     return price;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: AppTheme.padding,
//       child: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             ListView.builder(
//                 itemCount: controller.products.lenght,
//                 itemBuilder: (context, index) {}),
//             Divider(
//               thickness: 1,
//               height: 70,
//             ),
//             _price(),
//             SizedBox(height: 30),
//             _submitButton(context),
//           ],
//         ),
//       ),
//     );
//   }
// }
