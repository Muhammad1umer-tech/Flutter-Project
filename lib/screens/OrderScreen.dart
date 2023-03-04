import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/orders.dart';
import '../widget/orderItem.dart';

class Orderscreen extends StatelessWidget {
  static const routename = "/Orderscreen";
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<Orders>(context);
    final item = obj.orders;
    return Scaffold(
      appBar: AppBar(title: const Text("Your Orders")),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) => Order_Item(item[index]),
      ),
    );
  }
}
