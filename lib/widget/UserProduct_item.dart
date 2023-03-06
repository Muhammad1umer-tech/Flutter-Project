import 'package:flutter/material.dart';
import '../screens/edit_product_Screen.dart';

class UserItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageurl;

  UserItem({this.id, this.title, this.imageurl});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageurl),
      ),
      trailing: Container(
        width: 160,
        child: Column(
          children: [
            Row(children: [
              Spacer(),
              IconButton(
                  onPressed: () {
                    List<String> k = [];
                    k.add(id);
                    k.add("1");
                    print(id);
                    print("idddddddddd");
                    Navigator.of(context)
                        .pushNamed(edit_product_Screen.routename, arguments: k);
                  },
                  icon:
                      Icon(Icons.edit, color: Theme.of(context).primaryColor)),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Theme.of(context).errorColor,
                  )),
            ]),
          ],
        ),
      ),
    );
  }
}
