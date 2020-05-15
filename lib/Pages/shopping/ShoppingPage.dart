import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:palet/Pages/shopping/Shopping_list_new.dart';
import 'package:palet/constants.dart';
import '../../components/HorizontalList.dart';
import '../../components/products.dart';
import '../Cart.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';
import 'package:palet/Pages/shopping/Shopping_search.dart';

class ShoppingPage extends StatefulWidget {


  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {

  @override
  Widget build(BuildContext context) {
    Widget image_carousel=new Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('Asset/shoppingImages/Carousel.jpeg'),
          AssetImage('Asset/shoppingImages/Carousel1.jpeg'),
          AssetImage('Asset/shoppingImages/Carousel2.jpeg'),
          AssetImage('Asset/shoppingImages/Carousel3.jpeg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        //animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        //Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart())
      ),
    );
    return Scaffold(
       appBar:AppBar(
         elevation: 0.0,
         backgroundColor: kMainColor,
         centerTitle: true,

         title: Text('ShoppApp'),
         actions: <Widget>[
           IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){
             showSearch(context: context, delegate: DataSearch());
           },),
           IconButton(icon: Icon(Icons.list,color: Colors.white,),onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>new Shopping_list()));

           },),
           IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>new Newcart()));

           },)

         ],

       ),







      body: ListView(
        children: <Widget>[
          image_carousel,
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Categories'),

          ),
          HorizontalList(),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Recent Products'),


          ),
          Container(
            height: 320.0,
            child: Products(),
          )
        ],
      ),


    );
  }
}

