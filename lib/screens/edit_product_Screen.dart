import 'package:flutter/material.dart';

class edit_product_Screen extends StatefulWidget {
  static const routename = '/edit_product_screen';
  @override
  State<edit_product_Screen> createState() => _edit_product_ScreenState();
}

class _edit_product_ScreenState extends State<edit_product_Screen> {
  final _imageurlController = TextEditingController();

  @override
  void dispose() {
    _imageurlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Enter Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
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
                      decoration: const InputDecoration(
                        labelText: 'Image Url',
                      ),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageurlController,
                    ),
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
