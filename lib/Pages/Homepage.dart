import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palet/constants.dart';
class Home extends StatelessWidget{
  Newcart obj=new Newcart();

  final AuthService _auth = AuthService();
  TabController controller;
  @override




  Widget build( BuildContext context){
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
    bool loading = false;
    return loading? Loading() : StreamProvider<QuerySnapshot>.value(

      child: new Scaffold(
        backgroundColor: kMainColor,

        appBar: new AppBar(
          backgroundColor: kMainColor ,
          centerTitle: true,
          title: Text('Home',
          style: TextStyle(

            fontWeight:  FontWeight.bold,
            color: Colors.white
          ),),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.add_to_home_screen,color: Colors.white,),onPressed:  () async {
             await  _auth.signOut();
            },),
          ],

        ),
        body: Container(
          child: Padding(

            padding: const EdgeInsets.fromLTRB(60.0, 60.0, 60.0, 0.0),
            child: Container(

              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
//                new SizedBox(height:5.0, width: 100.0),

                  new Container(

                    child: CardRoute(cardTitle: 'Wallet',
                      icon: FontAwesomeIcons.wallet,
                    nextPage: 'wallet',),
                  ),
                  new Container(
                    child: CardRoute(cardTitle: 'Shop',
                    nextPage: 'shopping',icon: FontAwesomeIcons.shopify,)
                  ),
                  new Container(
                    child: CardRoute(cardTitle: 'Profile',
                      nextPage: 'profile',icon: Icons.person,)
                  ),
                  new Container(
                      child: CardRoute(cardTitle: 'Mobile Recharge',
                        nextPage: 'recharge',icon: FontAwesomeIcons.phone,)
                  ),
                  new Container(
                      child: CardRoute(cardTitle: 'Bus Tickets',
                        nextPage: 'bus',icon: FontAwesomeIcons.bus,)
                  ),
                  new Container(
                    child: CardRoute(
                      cardTitle: 'Logout',
                      icon: FontAwesomeIcons.angry,
                      onPressed: ()async {
                        obj.cart_clear();
                        _auth.signOut();
                      },
                    ),
                  ),







                ],
              ),

            ),


          ),
        ),


      ),
    );


  }
}



//For Logout
//onTap: ()async{
//
//loading = true;
//await _auth.signOut();
//
//
//},



class CardRoute extends StatelessWidget {

  final String cardTitle;
  final String nextPage;
  final IconData icon;
  final Function onPressed;


   CardRoute({this.cardTitle, this.nextPage, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: new Card(elevation: 10.0,
        color: Color(0xFADEFABB),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child:
        Container(

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                colors: [Colors.white, Colors.white],
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              Icon(icon,
                color: Colors.grey[700],
                size: 50.0,
              ),
              new SizedBox(height: 10.0),
              new Text(cardTitle,
              style: TextStyle(
                color: Colors.grey
              ),),
            ],
          ),


        ),
      ),
      onTap: (){
        Navigator.pushNamed(context,'/$nextPage');
      },
      onDoubleTap: onPressed,
    );
  }
}

