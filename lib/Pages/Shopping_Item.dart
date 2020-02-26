import 'package:flutter/material.dart';
class ShoppingItem extends StatefulWidget {
  @override
  _ShoppingItemState createState() => _ShoppingItemState();
}

class _ShoppingItemState extends State<ShoppingItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(key: new Key("1"),child: ListTile(
      title: Text("Todo: item"),
      leading: Checkbox(value: false,onChanged: null,
      ),
      trailing: IconButton(icon: Icon(Icons.delete),onPressed: null,),
    ) ,);
  }
}
