import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/Shopping_cart.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Shoppingcart(),
      //Cart_products(),

      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("Total"),
                subtitle: Text("\$230"),

              ),
            ),
            Expanded(
              child: MaterialButton(onPressed: (){},
              child: Text("Check Out",style: TextStyle(
                color: Colors.white
              ),),
                color: Colors.teal,
              )

            )
          ],
        ),
      ),
    );
  }
}
