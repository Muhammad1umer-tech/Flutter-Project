import 'package:flutter/material.dart';
import 'package:shop/Provider/cart.dart';
import 'package:shop/Provider/product.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    this.id,
    this.amount,
    this.products,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> pro, double total) {
    var obj = OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: pro,
        dateTime: DateTime.now());
    _orders.insert(0, obj);
    notifyListeners();
  }
}
