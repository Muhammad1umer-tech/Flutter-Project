import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/Products.dart';
import 'package:shop/Provider/cart.dart';
import 'package:shop/Provider/orders.dart';
import 'package:shop/screens/CartScreen.dart';
import 'package:shop/screens/product_overview.dart';

import 'widget/product.detail.dart';
import './screens/OrderScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Carts(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop App',
        theme: ThemeData(
          primaryColor: Colors.purple,
          errorColor: Colors.red,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
        ),
        home: product_OverView(),
        routes: {
          Product_Detail.routename: (context) => Product_Detail(),
          CartScreen.routename: (context) => CartScreen(),
          Orderscreen.routename: (context) => Orderscreen(),
        },
      ),
    );
  }
}
