import 'package:flutter/material.dart';

class Product_Detail extends StatelessWidget {
  static const routename = '/product_Detail';

  @override
  Widget build(BuildContext context) {
    final Id = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(Id),
      ),
    );
  }
}
