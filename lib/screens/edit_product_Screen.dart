import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/Provider/Products.dart';
import '../Provider/product.dart';

class edit_product_Screen extends StatefulWidget {
  static const routename = '/edit_product_screen';
  @override
  State<edit_product_Screen> createState() => _edit_product_ScreenState();
}

class _edit_product_ScreenState extends State<edit_product_Screen> {
  final _imageurlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    title: '',
    description: '',
    price: 0,
    imageUrl: '',
  );

  @override
  void dispose() {
    _imageurlController.dispose();
    super.dispose();
  }

  void saveform() {
    final isvalid = _form.currentState.validate();
    if (!isvalid) return;

    _form.currentState.save();
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.save))],
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                onSaved: (newValue) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: newValue,
                    description: _editedProduct.description,
                    price: _editedProduct.price,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Enter Price'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Provide a Price';
                    }
                    if (double.tryParse(value) == null)
                      return 'Please enter A valid Number';

                    if (double.parse(value) <= 0)
                      return 'Please enter a number greater than Zero';
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(newValue),
                      imageUrl: _editedProduct.imageUrl,
                    );
                  }),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please Provide a Decription';
                    }
                    if (value.length < 10)
                      return 'Please enter atelst 10 characters';

                    return null;
                  },
                  maxLines: 3,
                  onSaved: (newValue) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: newValue,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  }),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: Container(
                        child: _imageurlController.text.isEmpty
                            ? const Text("Enter a URL")
                            : FittedBox(
                                child: Image.network(
                                  _imageurlController.text,
                                  fit: BoxFit.cover,
                                ),
                              )),
                  ),
                  Expanded(
                    child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please Provide an image';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Image Url',
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageurlController,
                        onFieldSubmitted: (value) => saveform(),
                        onSaved: (newValue) {
                          _editedProduct = Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            description: _editedProduct.description,
                            price: _editedProduct.price,
                            imageUrl: newValue,
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
