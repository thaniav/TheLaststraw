import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Home extends StatelessWidget{
  final AuthService _auth = AuthService();
  TabController controller;
  @override




  Widget build( BuildContext context){
    bool loading = false;
    return loading? Loading() : StreamProvider<QuerySnapshot>.value(

      child: new Scaffold(

        appBar: new AppBar(
          backgroundColor: Colors.teal[900] ,
          centerTitle: true,
          title: Text('Home',
          style: TextStyle(

            fontWeight:  FontWeight.bold,
            color: Colors.teal[900]
          ),),
          flexibleSpace:  Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.tealAccent,
            Colors.teal[800],
          ],
        ),
      ),
    ),
        ),
        body: Padding(

          padding: const EdgeInsets.all(60.0),
          child: Container(

            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
//                new SizedBox(height:5.0, width: 100.0),

                new Container(

                  child: CardRoute(cardTitle: 'Wallet',
                    icon: Icons.mobile_screen_share,
                  nextPage: 'wallet',),
                ),
                new Container(
                  child: CardRoute(cardTitle: 'Shop',
                  nextPage: 'profile',icon: Icons.shopping_basket,)
                ),
                new Container(
                  child: CardRoute(cardTitle: 'Profile',
                    nextPage: 'shopping',icon: Icons.person,)
                ),
                new Container(
                    child: CardRoute(cardTitle: 'Mobile Recharge',
                      nextPage: 'recharge',icon: Icons.person,)
                ),
                new Container(
                    child: CardRoute(cardTitle: 'Movie Tickets',
                      nextPage: 'movie',icon: Icons.person,)
                ),
                new Container(
                  child: CardRoute(
                    cardTitle: 'Logout',
                    icon: Icons.signal_cellular_off,
                    onPressed: ()async {
                      _auth.signOut();
                    },
                  ),
                ),
                new Container(
                    child: CardRoute(cardTitle: 'Bus Tickets',
                      nextPage: 'bus',icon: Icons.person,)
                ),






              ],
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
                colors: [Color(0xFF3CCD94),Colors.tealAccent],
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              Icon(icon,
                color: Colors.teal[900],
                size: 50.0,
              ),
              new SizedBox(height: 10.0),
              new Text(cardTitle,
              style: TextStyle(
                color: Colors.teal[900]
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

