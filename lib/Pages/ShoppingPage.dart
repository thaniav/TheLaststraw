import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../components/HorizontalList.dart';
import '../components/products.dart';
import 'Cart.dart';
import 'Shopping_cart.dart';

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
          AssetImage('Asset/c1.jpg'),
          AssetImage('Asset/m1.jpeg'),
          AssetImage('Asset/m2.jpg'),
          AssetImage('Asset/w1.jpeg'),
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
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('ShoppApp'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){},),
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new Shoppingcart()));

          },)

        ],

      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text('Mihir'),
              accountEmail:Text('mihir@gmail.com'),

              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.teal
              ),
            ),
            //body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('HomePage'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.black,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
              },
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.amber,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.grey[600],),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.blue,),
              ),
            ),



          ],
        ),
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

