import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/orders.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<Orders>(context);
    final item = obj.orders;
    return Scaffold(
      appBar: AppBar(title: Text('Order')),
      body: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) => Card(
                child: Row(children: [
                  Container(
                    child: CircleAvatar(
                      child: FittedBox(
                        child: Text(item[index].amount.toString()),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(item[index].id),
                      Text(item[index].id),
                    ],
                  ),
                  Spacer(),
                  Container(/*date*/),
                ]),
              )),
    );
  }
}
