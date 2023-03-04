import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String title;
  final String imageurl;

  UserItem({this.title, this.imageurl});
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
                  onPressed: () {},
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
