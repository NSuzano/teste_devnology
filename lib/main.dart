import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/src/config/route.dart';
import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/pages/mainPage.dart';
import 'package:flutter_ecommerce_app/src/pages/product_detail.dart';
import 'package:flutter_ecommerce_app/src/widgets/customRoute.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_ecommerce_app/controller/http.dart';
import 'package:provider/provider.dart';

import 'controller/di.dart';
import 'src/themes/theme.dart';

void main() async {
  Di di = Di();
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Http http = Http();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.fromFuture(http.getProducts()),
      builder: (context, response) {
        if (!response.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (response.hasError) {
          return Center(
            child: Text(response.error),
          );
        } else {
          return MultiProvider(
            providers: [
              Provider<List<Product>>.value(value: response.data),
            ],
            child: GetMaterialApp(
              title: 'E-Commerce ',
              theme: AppTheme.lightTheme.copyWith(
                textTheme: GoogleFonts.mulishTextTheme(
                  Theme.of(context).textTheme,
                ),
              ),
              debugShowCheckedModeBanner: false,
              routes: Routes.getRoute(),
              onGenerateRoute: (RouteSettings settings) {
                if (settings.name.contains('detail')) {
                  return CustomRoute<bool>(
                      builder: (BuildContext context) => ProductDetailPage());
                } else {
                  return CustomRoute<bool>(
                      builder: (BuildContext context) => MainPage());
                }
              },
              initialRoute: "MainPage",
            ),
          );
        }
      },
    );
  }
}
