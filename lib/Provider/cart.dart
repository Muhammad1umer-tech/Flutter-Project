import 'package:flutter/material.dart';
import 'package:shop/Provider/product.dart';
import 'package:shop/screens/product_overview.dart';

import 'Products.dart';

class CartItem {
  final String ProductiD;
  final double price;
  int quantity;

  CartItem(this.ProductiD, this.price, this.quantity);
}

class Carts with ChangeNotifier {
  Map<String, CartItem> _item = {};

  int get item_length {
    return _item.length;
  }

  Map<String, CartItem> get items {
    return {..._item};
  }

  var itemCount = 0;
  void addItem(String ProductId) {
    print(ProductId);
    if (_item.containsKey(ProductId)) {
      _item.update(
        ProductId,
        (cart) => CartItem(cart.ProductiD, cart.price, cart.quantity += 1),
      );
    } else {
      var obj = Products();
      var it = obj.items;
      var price = 0.0;
      for (int a = 0; a < it.length; a++) {
        if (it[a].id == ProductId) {
          price = it[a].price;
          break;
        }
      }
      _item.putIfAbsent(ProductId, () => CartItem(ProductId, price, 1));
    }
    itemCount++;
    notifyListeners();
  }

  double get total {
    var TotalPrice = 0.0;
    for (int a = 0; a < _item.length; a++) {
      TotalPrice +=
          _item.values.toList()[a].price * _item.values.toList()[a].quantity;
    }
    return TotalPrice;
  }

  List<Product> get cart_Product {
    List<Product> pro = [];
    final it = Products();
    for (int a = 0; a < _item.length; a++) {
      var id = _item.keys.toList()[a];
      pro.add(
        it.items.firstWhere((element) => element.id == id),
      );
    }
    return pro;
  }

  int return_quantity(String id) {
    int quantity = 0;
    for (int a = 0; a < _item.length; a++) {
      if (_item.keys.toList()[a] == id) {
        return _item.values.toList()[a].quantity;
      }
    }
  }

  void remove_item(String productID) {
    int quan = 0;
    for (int a = 0; a < _item.length; a++) {
      if (_item.keys.toList()[a] == productID) {
        quan = _item.values.toList()[a].quantity;
        break;
      }
    }
    itemCount -= quan;
    _item.remove(productID);
    notifyListeners();
  }

  void clear() {
    _item = {};
    itemCount = 0;
    notifyListeners();
  }

  void undo(String id) {
    if (_item[id].quantity > 1) {
      _item.update(
          id,
          (Cart_Item) => CartItem(
                Cart_Item.ProductiD,
                Cart_Item.price,
                Cart_Item.quantity -= 1,
              ));
    } else {
      _item.remove(id);
    }
    itemCount -= 1;
    notifyListeners();
  }
}
