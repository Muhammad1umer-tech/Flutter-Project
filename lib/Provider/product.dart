import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool favroite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.favroite = false,
  });

  void toggleFavoite() {
    favroite = !favroite;
    notifyListeners();
  }
}
