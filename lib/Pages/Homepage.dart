import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palet/Pages/spinner/spin_home.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palet/constants.dart';
class Home extends StatelessWidget{
  final AuthService _auth = AuthService();
  TabController controller;
  @override

//update


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
        drawer: Drawer(
          child: ListView(
            children: <Widget>[

            StreamBuilder<UserData>(
              stream: DatabaseService(uid: current_user_uid).userData,
              builder: (context, snapshot) {
                UserData userData=snapshot.data;
               if(snapshot.hasData) {
                  return UserAccountsDrawerHeader(
                    accountName: Text(userData.name),
                    accountEmail: Text(userData.emailID),

                    currentAccountPicture: GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        child: Icon(Icons.person),
                      ),
                    ),
                    decoration: BoxDecoration(
                        color: kSecondaryColor
                    ),
                  );
                }
                else{return Container();}
              }
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
                onTap: (){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/profile');
                },
                child: ListTile(
                  title: Text('My profile'),
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
                },
                child: ListTile(
                  title: Text('Shopping Cart'),
                  leading: Icon(Icons.shopping_cart,color: Colors.amber,),
                ),
              ),
              InkWell(
                onTap: (){
                  
                },
                child: ListTile(
                  title: Text('Change Theme'),
                  leading: Icon(Icons.palette),
                ),
              ),
              Divider(),

              InkWell(
                onTap: ()async{
                  await _auth.signOut();
                },
                child: ListTile(
                  title: Text('Logout'),
                  leading: Icon(Icons.add_to_home_screen,color: Colors.black,),
                ),
              ),





            ],
          ),
        ),

        appBar: new AppBar(

          elevation: 0.0,

          backgroundColor: kMainColor ,
          centerTitle: true,
          title: Row(
            children: <Widget>[
              Text('Home',
              style: TextStyle(

                fontWeight:  FontWeight.bold,
                color: Colors.white
              ),),
            ],
          ),

        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex:11,
              child: GridView.count(
                crossAxisCount: 2,
                children: <Widget>[
          
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
                      child: CardRoute(cardTitle: 'Movie Tickets',
                        nextPage: 'recharge',icon: FontAwesomeIcons.film,)
                  ),

        
        
                ],
              ),
    
            ),
            Expanded(
                flex: 1,
                child:  RawMaterialButton(onPressed: (){
                  Navigator.pushNamed(context, '/spin');
                  Navigator.pushNamed(context, SpinnerPage.id);
                },
                  child: Text('Lucky Spin',style: TextStyle(fontStyle: FontStyle.italic),),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  fillColor: Colors.yellowAccent,
                )
            ),
            SizedBox(
              height: 10.0,
            ),
  
          ],
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

