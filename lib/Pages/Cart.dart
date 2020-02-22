import 'package:flutter/material.dart';
import 'package:palet/components/Cart_products.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('Cart'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){},),
          //IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: (){},)

        ],

      ),
      body: Cart_products(),

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
