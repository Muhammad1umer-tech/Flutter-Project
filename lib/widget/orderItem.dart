import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/Provider/orders.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class Order_Item extends StatefulWidget {
  final OrderItem order;

  Order_Item(this.order);

  @override
  State<Order_Item> createState() => _Order_ItemState();
}

class _Order_ItemState extends State<Order_Item> {
  var expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(children: [
        ListTile(
          title: Text('\$ ${widget.order.amount.toString()}'),
          subtitle: Text(
            DateFormat('dd/MM/yyyy   hh:mm').format(widget.order.dateTime),
          ),
          trailing: IconButton(
            onPressed: () {
              setState(() {
                expanded = !expanded;
              });
            },
            icon: expanded == false
                ? Icon(Icons.expand_less)
                : Icon(Icons.expand_more),
          ),
        ),
        if (expanded == true)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            height: min(widget.order.products.length * 20.0 + 10.0, 100.0),
            child: ListView(
              children: widget.order.products
                  .map((e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(e.ProductiD,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            '\$ ${e.quantity}X ${e.price}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          )
                        ],
                      ))
                  .toList(),
            ),
          )
      ]),
    );
  }
}
