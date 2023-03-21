import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controller/cart_controller.dart';
import 'package:flutter_ecommerce_app/src/model/data.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/model/supplier1.dart';
import 'package:flutter_ecommerce_app/src/themes/light_color.dart';
import 'package:flutter_ecommerce_app/src/themes/theme.dart';
import 'package:flutter_ecommerce_app/src/widgets/cart_total.dart';
import 'package:flutter_ecommerce_app/src/widgets/title_text.dart';
import 'package:get/get.dart';

class ShoppingCartPage extends StatelessWidget {
  final CartController controller = Get.find();

  ShoppingCartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SizedBox(
          height: 600,
          child: Column(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return CartProductCard(
                      controller: controller,
                      sup: controller.products.keys.toList()[index],
                      quant: controller.products.values.toList()[index],
                      index: index,
                    );
                  }),
              SizedBox(
                height: 50,
              ),
              CartTotal()
            ],
          ),
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
            backgroundImage: NetworkImage(sup.imagem),
          ),
          SizedBox(
            width: 20,
          ),
          Text(sup.nome),
          IconButton(
              onPressed: () {
                controller.removeProduct(sup);
              },
              icon: Icon(Icons.remove_circle_outline)),
          Text(quant.toString()),
          IconButton(
              onPressed: () {
                controller.addProduct(sup);
              },
              icon: Icon(Icons.add_circle_outline_outlined)),
        ],
      ),
    );
  }
}

Widget _cartTotal(SupplierBR model) {
  final CartController controller = Get.find();

  return Obx(
    () => Container(
      color: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 75),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Total",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "${controller.total}",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
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
                child: Image.network(model.imagem),
              )
            ],
          ),
        ),
        Expanded(
            child: ListTile(
                title: TitleText(
                  text: model.name,
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
                      text: model.preco.toString(),
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
                    text: 'x${model.id}',
                    fontSize: 12,
                  ),
                )))
      ],
    ),
  );
}

Widget _price(SupplierBR model) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      TitleText(
        text: '${AppData.cartList.length} Items',
        color: LightColor.grey,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      TitleText(
        text: '\$${model.preco}',
        fontSize: 18,
      ),
    ],
  );
}

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
