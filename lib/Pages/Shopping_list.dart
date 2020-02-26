import 'package:flutter/material.dart';
import 'package:palet/components/Cart_products.dart';
import 'package:palet/components/New_products.dart';
import 'package:palet/components/products.dart';
import 'package:palet/Pages/Shopping_cart.dart';

 class ShoppingList extends StatelessWidget {
   int Qty=0;
   final ValueSetter<ProductModel> _valueSetter;
   ShoppingList( this._valueSetter);
   List<ProductModel> products=[
     ProductModel("Blazer",80),
     ProductModel("Red dress",50)
   ];




   @override
   Widget build(BuildContext context) {
   //
     //  var cart_products_price=Single_cart_products().cart_product_price;
     return ListView.separated(itemBuilder: (context,index){
       return ListTile(
           //leading: Image.asset(Single_cart_products().cart_product_picture,width:80,height: 100,),
         title: Text(products[index].name),

         trailing: Text("\$${products[index].price}"),
         onTap: (){
           _valueSetter(products[index]);


         }
         ,

         subtitle: Text("$Qty"),
         leading: IconButton(icon: Icon(Icons.add,color: Colors.black,),onPressed: (


             ){



         },),
       );
     },
         separatorBuilder: (context,index){
       return Divider();
         },

         itemCount: products.length);
   }
 }

