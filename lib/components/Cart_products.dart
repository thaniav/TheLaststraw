import 'package:flutter/material.dart';
class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_cart=[
    {
      "name":"Blazer",
      "picture":"Asset/blazer1.jpeg",
      "price":80,
      "size":"M",
      "color":"R",
      "Qty":1

    },
    {
      "name":"RedDress",
      "picture":"Asset/dress1.jpeg",
      "price":80,
      "size":"M",
      "color":"R",
      "Qty":1

    },


  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_cart.length,
        itemBuilder: (context,index){
          return Single_cart_products(
            cart_product_name: Products_on_cart[index]["name"],
            cart_product_color: Products_on_cart[index]["color"],
            cart_product_qty: Products_on_cart[index]["qty"],
            cart_product_size: Products_on_cart[index]["size"],

          );

    }
    );
  }
}
class Single_cart_products extends StatefulWidget {
  final cart_product_name;
  final cart_product_price;
  final cart_product_picture;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;
  Single_cart_products({
this.cart_product_color,
    this.cart_product_name,
    this.cart_product_picture,
    this.cart_product_price,
    this.cart_product_size,
    this.cart_product_qty
});





  @override
  _Single_cart_productsState createState() => _Single_cart_productsState();
}

class _Single_cart_productsState extends State<Single_cart_products> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

