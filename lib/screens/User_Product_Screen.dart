import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/screens/app_Drawer.dart';
import 'package:shop/widget/UserProduct_item.dart';

import '../Provider/Products.dart';
import '../screens/edit_product_Screen.dart';

class UserProductScreen extends StatelessWidget {
  static const routename = '/UserProductScreen';
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<Products>(context);
    final item = obj.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Screen'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routename,
                    arguments: item[0].id);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) => ChangeNotifierProvider.value(
            value: item[index],
            child: UserItem(),
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
