import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/cart.dart';
import 'package:shop/Provider/orders.dart';

class CartScreen extends StatelessWidget {
  static const routename = "/CartScreen";
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<Carts>(context);
    final obj1 = Provider.of<Orders>(context, listen: false);
    final _item = obj.cart_Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Screen'),
      ),
      body: Column(
        children: [
          Container(
            height: 75,
            child: Card(
              elevation: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total Amount :"),
                  Chip(
                      backgroundColor: Theme.of(context).primaryColor,
                      label: FittedBox(
                          fit: BoxFit.cover,
                          child: Text('\$ ${obj.total.toString()}'))),
                  TextButton(
                      onPressed: () {
                        obj1.addOrder(obj.items.values.toList(), obj.total);
                        obj.clear();
                      },
                      child: Text(
                        'Click To Proceed',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ))
                ],
              ),
            ),
          ),
          Container(
            height: 500,
            child: ListView.builder(
                itemCount: _item.length,
                itemBuilder: (context, index) => Dismissible(
                      confirmDismiss: (d) {
                        return showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Are you sure?'),
                            content: Text('Do you to delete item from cart?'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Text('Yes')),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('No')),
                            ],
                          ),
                        );
                      },
                      key: ValueKey(_item[index].id),
                      onDismissed: (di) {
                        obj.remove_item(_item[index].id);
                      },
                      background: Container(
                        color: Theme.of(context).errorColor,
                        alignment: Alignment.centerRight,
                        child: const IconButton(
                            icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        )),
                      ),
                      direction: DismissDirection.endToStart,
                      child: Card(
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                  _item[index].imageUrl,
                                ),
                              ),
                            ),
                            Text(_item[index].title),
                            Spacer(),
                            Text(
                                '\$ ${_item[index].price.toStringAsFixed(2).toString()}'),
                            SizedBox(width: 25),
                            Text(
                                '${obj.return_quantity(_item[index].id).toString()} X'),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
