import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _item = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  int get item_length {
    return _item.length;
  }

  List<Product> get items {
    return [..._item];
  }

  List<Product> get fav_items {
    return _item.where((element) => element.favroite == true).toList();
  }

  void addProduct(Product pro) {
    final newpro = Product(
      id: DateTime.now().toString(),
      title: pro.title,
      description: pro.description,
      price: pro.price,
      imageUrl: pro.imageUrl,
    );

    _item.add(pro);
    _item.insert(0, pro); //to insert at start
    notifyListeners();
  }

  void editProduct(String id, Product pro) {
    var editPro = Product();

    for (int a = 0; a < _item.length; a++) {
      if (_item[a].id == id) {
        _item[a] = pro;
        break;
      }
    }
  }
}
