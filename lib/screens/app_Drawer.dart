import 'package:flutter/material.dart';
import 'package:shop/screens/CartScreen.dart';
import 'package:shop/screens/OrdersScreen.dart';

import 'OrderScreen.dart';
import 'User_Product_Screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: Text('Hello'),
          automaticallyImplyLeading: false,
        ),
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.payment),
            onPressed: () {
              Navigator.of(context).pushNamed(Orderscreen.routename);
            },
          ),
          title: Text('Orders'),
        ),
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.shop),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          title: Text('Shop'),
        ),
        ListTile(
          leading: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(UserProductScreen.routename);
            },
          ),
          title: Text('Manage Products'),
        ),
      ]),
    );
  }
}
