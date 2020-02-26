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
      "color":"Black",
      "Qty":1

    },
    {
      "name":"RedDress",
      "picture":"Asset/dress1.jpeg",
      "price":80,
      "size":"7",
      "color":"Red",
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
            cart_product_qty: Products_on_cart[index]["Quantity"],
            cart_product_picture: Products_on_cart[index]["picture"],
            cart_product_size: Products_on_cart[index]["size"],
            cart_product_price: Products_on_cart[index]["price"],
          );

    }
    );
  }
}
class Single_cart_products extends StatelessWidget {
  final cart_product_name;
  final cart_product_price;
  final cart_product_picture;
  final cart_product_size;
  final cart_product_color;
  final cart_product_qty;
  Single_cart_products({
     this.cart_product_name,
    this.cart_product_price,
    this.cart_product_picture,
    this.cart_product_qty,
    this.cart_product_size,
    this.cart_product_color
});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(cart_product_picture,width:80,height: 100,),
        title: Text(cart_product_name),
        subtitle: Column(
          children: <Widget>[
            //Row
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("Size:"),

                ),
                Padding(
                padding: EdgeInsets.all(8.0),
                  child: Text(cart_product_size,style: TextStyle(
                      color: Colors.teal
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Color"),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(cart_product_color,style: TextStyle(
                    color: Colors.teal
                  ),),
                )

              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text("\$$cart_product_price"),
            )
          ],
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up),onPressed: (){},),
            IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: (){},),
          ],
        ),
      ),
    );
  }
}
