import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/Shopping_list_new.dart';
import 'package:palet/Pages/shopping/New_products.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/Pages/shopping/product_details.dart';

Shopping_list obj = new Shopping_list();
final List<String> products=obj.products_send();
final List<String> recent=["Airpods","Bose Headphones","Iphone 11"];
final List<ProductModel> productDetails=obj.productDetails();



class DataSearch extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear),onPressed: (){
      query="";
    },)];
  }

  @override
  Widget buildLeading(BuildContext context) {

    return IconButton(icon:AnimatedIcon(
      icon:AnimatedIcons.menu_arrow ,progress:transitionAnimation ,
    ) ,onPressed: (){
      close(context, null);
    },);
  }

  @override
  Widget buildResults(BuildContext context) {
    for(int i=0;i<productDetails.length;i++)
      {
        if(query.toLowerCase()==productDetails[i].name.toLowerCase().substring(0,query.length)){
          return new ProductDetails(
              product_detail_name: productDetails[i].name,
              product_detail_new_price: productDetails[i].price,
              product_detail_old_price: productDetails[i].oldprice,
              product_detail_picture: productDetails[i].picture,
          product_detail_detail: productDetails[i].details,);
        }


      }

    return AlertDialog(
    title: Text('Not found'),

    );

//    return  Card(
//      color: kMainColor,
//      child: ListTile(
//        onTap: (){
//
//          Cart_add(products[index]);
//
//        },
//        title: Text(products[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//        trailing: Text("\$${products[index].price}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//        //subtitle: Text("${products[index].quantity}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
//
//      ),
//    );;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   final List<String> suggestionlist=query.isEmpty?recent:products.where((p)=>p.toLowerCase().startsWith(query.toLowerCase())).toList();
   return ListView.builder(
       itemBuilder:(context,index)=>ListTile(
         onTap:(){
           showResults(context);
         },
     leading: Icon(Icons.phone_android),
     title: RichText(text: TextSpan(
       text: suggestionlist[index].substring(0,query.length),
       style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
       children: [TextSpan(
         text: suggestionlist[index].substring(query.length),
         style: TextStyle(
           color: Colors.grey
         )
       )],

     ),

     ),
   ),
     itemCount: suggestionlist.length,
   );
  }

}