import 'package:flutter/material.dart';
class Checkout extends StatelessWidget {
  final cart;
  final sum;
  Checkout({
    this.cart,
    this.sum
});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
            itemBuilder: (context,index){
          return ListTile(
            //leading: Image.asset(Single_cart_products().cart_product_picture,width:80,height: 100,),
            title: Text(cart[index].name),
            trailing: Text("\$${cart[index].price}"),
            onTap: (){

            }
            ,


          );
        },
            separatorBuilder: (context,index){
              return Divider();
            },
            itemCount:cart.length,
        shrinkWrap: true),
        Divider(),
        //Text("\$$sum")



      ],
    );
  }
}
