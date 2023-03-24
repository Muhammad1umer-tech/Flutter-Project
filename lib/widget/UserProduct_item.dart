import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/edit_product_Screen.dart';
import '../Provider/product.dart';
import '../Provider/Products.dart';

class UserItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<Product>(context);
    final obj1 = Provider.of<Products>(context);
    return ListTile(
      title: Text(obj.title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(obj.imageUrl),
      ),
      trailing: Container(
        width: 160,
        child: Column(
          children: [
            Row(children: [
              Spacer(),
              IconButtonll(
                  onPressed: () {
                    Navigator.of(context).pushNamed(EditProductScreen.routename,
                        arguments: obj.id);
                  },
                  icon:
                      Icon(Icons.edit, color: Theme.of(context).primaryColor)),
              IconButton(
                  onPressed: () {
                    obj1.deleteProduct(obj.id);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}
