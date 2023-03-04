import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/cart.dart';
import 'package:shop/Provider/product.dart';
import 'package:shop/screens/CartScreen.dart';
import 'package:shop/screens/app_Drawer.dart';
import 'package:shop/widget/badge.dart';

import 'package:shop/widget/product.detail.dart';
import '../Provider/Products.dart';

class product_OverView extends StatefulWidget {
  @override
  State<product_OverView> createState() => _product_OverViewState();
}

class _product_OverViewState extends State<product_OverView> {
  var favorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop App'),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: ((value) {
              setState(() {
                if (value == 0)
                  favorite = true;
                else
                  favorite = false;
              });
            }),
            itemBuilder: ((context) => [
                  PopupMenuItem(
                    child: Text("Only Favorite"),
                    value: 0,
                    onTap: () {},
                  ),
                  const PopupMenuItem(
                    child: Text("Show All"),
                    value: 1,
                  ),
                ]),
          ),
          Consumer<Carts>(
            builder: (context, obj, child) => Badge(
                value: obj.itemCount.toString(),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routename);
                  },
                  icon: const Icon(Icons.shopping_cart),
                )),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: NewWidget(favorite),
    );
  }
}

class NewWidget extends StatelessWidget {
  final bool fav;
  NewWidget(this.fav);
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<Products>(context, listen: false);
    final item = fav == false ? obj.items : obj.fav_items;
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemCount: item.length,
        itemBuilder: (context, index) => ChangeNotifierProvider.value(
              // create: (context) => item[index],
              value: item[index],
              child: productGrid(),
            ));
  }
}

// was unable to use id so extract widget and use title, id, iamgeurl as an argument

class productGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final obj = Provider.of<Product>(context, listen: false);
    final obj1 = Provider.of<Carts>(context, listen: false);
    print(obj.id);
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(Product_Detail.routename, arguments: obj.id);
      },
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, value, ch) => IconButton(
              onPressed: () {
                obj.toggleFavoite();
              },
              color: Colors.deepOrange,
              // Theme.of(context).colorScheme.secondary
              icon: obj.favroite == true
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
            ),
          ),
          subtitle: Text(obj.title),
          backgroundColor: Colors.black54,
          trailing: IconButton(
            onPressed: () {
              obj1.addItem(obj.id);
            },
            color: Theme.of(context).colorScheme.secondary,
            icon: const Icon(Icons.shopping_cart),
          ),
        ),
        child: Image.network(
          obj.imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
