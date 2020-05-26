import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';

import 'package:palet/shared/loading.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palet/shared/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color tileColor = Colors.white;

  final AuthService _auth = AuthService();

  TabController controller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showDialog<String>(
        context: context,
        builder: (BuildContext context) => new AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Use Pallet for all your banking needs',
              style: TextStyle(color: kMainColor, fontFamily: 'PatuaOne'),
            ),
          ),
          content: Container(
            height: 308.0,
            width: 300.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.bus),
                        Text('Book Buses'),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.shopify),
                        Text('Shop for \nclothes'),
                      ],
                    ),
                    VerticalDivider(),
                    Column(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.mobile),
                        Text('Pay Bills'),
                      ],
                    ),
                  ],
                ),
                Image(
                  image: AssetImage('Asset/happy.jpeg'),
                )
              ],
            ),
          ),
          actions: <Widget>[],
        ),
      );
    });
    super.initState();
  }

  @override
//update

  Widget build(BuildContext context) {
    bool loading = false;
    return loading
        ? Loading()
        : StreamProvider<QuerySnapshot>.value(
            child: new Scaffold(
              backgroundColor: kMainColor,
              drawer: Drawer(
                child: ListView(
                  children: <Widget>[
                    StreamBuilder<UserData>(
                        stream: DatabaseService(uid: current_user_uid).userData,
                        builder: (context, snapshot) {
                          UserData userData = snapshot.data;
                          if (snapshot.hasData) {
                            return UserAccountsDrawerHeader(
                              accountName: Text("Hello "+userData.name+ "!", style: TextStyle(),),
                              accountEmail: Text(userData.emailID),
                              currentAccountPicture: GestureDetector(
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Icon(Icons.person),
                                ),
                              ),
                              decoration: BoxDecoration(color: kMainColor),
                            );
                          } else {
                            return Container();
                          }
                        }),
                    StreamBuilder<WalletData>(
                        stream: DatabaseService(uid: current_user_uid).walletData,
                        builder: (context, snapshot) {
                          WalletData walletData = snapshot.data;
                          if (snapshot.hasData) {
                            return InkWell(
                              splashColor: kSplashColor,
                              onTap: () {
                                Navigator.pushNamed(context, Newcart.id);
                              },
                              child: ListTile(
                                title: Text('Pallet Balance'),
                                leading: Icon(
                                  Icons.account_balance_wallet,
                                  color: Colors.black,
                                ),
                                trailing: Text("₹"+walletData.balance.toString(),
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        }),
                    Divider(),
                    //body
                    InkWell(
                      splashColor: kSplashColor,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: ListTile(
                        title: Text('HomePage'),
                        leading: Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      splashColor: kSplashColor,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/profile');
                      },
                      child: ListTile(
                        title: Text('My profile'),
                        leading: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      splashColor: kSplashColor,
                      onTap: () {
                        Navigator.pushNamed(context, Newcart.id);
                      },
                      child: ListTile(
                        title: Text('My orders'),
                        leading: Icon(
                          Icons.shopping_basket,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Divider(),
                    InkWell(
                      splashColor: kSplashColor,
                      onTap: () {},
                      child: ListTile(
                        title: Text('Shopping Cart'),
                        leading: Icon(
                          Icons.shopping_cart,
                          color: Colors.black,
                        ),
                      ),
                    ),

                    Divider(),

                    SizedBox(
                      height: 50.0,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ProgressButton(
                        color: kMainColor,
                        defaultWidget: Text('Logout'),
                        progressWidget: SpinKitChasingDots(
                          color: kMainColor,
                        ),
                        type: ProgressButtonType.Outline,
                        animate: true,
                        width: 196,
                        height: 40,
                        onPressed: () async {
                          int score = await Future.delayed(
                              const Duration(milliseconds: 1000), () => 42);
                          await _auth.signOut();
                          // After [onPressed], it will trigger animation running backwards, from end to beginning
                          return () {
                            // Optional returns is returning a VoidCallback that will be called
                            // after the animation is stopped at the beginning.
                            // A best practice would be to do time-consuming task in [onPressed],
                            // and do page navigation in the returned VoidCallback.
                            // So that user won't missed out the reverse animation.
                          };
                        },
                      ),
                    ),
                  ],
                ),
              ),
              appBar: new AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                title: Row(
                  children: <Widget>[
                    Text(
                      'Pallet',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Container(
                              child: CardRoute(
                                cardTitle: 'Wallet',
                                icon: FontAwesomeIcons.wallet,
                                nextPage: 'wallet',
                              ),
                            ),
                            Container(
                              height: 100.0,
                              color: Colors.white30,
                              width: 0.5,
                            ),
                            new Container(
                                child: CardRoute(
                              cardTitle: 'Shop',
                              nextPage: 'shopping',
                              icon: FontAwesomeIcons.shopify,
                            )),
                          ],
                        ),
                        Divider(color: Colors.white30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Container(
                                child: CardRoute(
                              cardTitle: 'Profile',
                              nextPage: 'profile',
                              icon: Icons.person,
                            )),
                            Container(
                              height: 100.0,
                              color: Colors.white30,
                              width: 0.5,
                            ),
                            new Container(
                                child: CardRoute(
                              cardTitle: 'Mobile Recharge',
                              nextPage: 'recharge',
                              icon: FontAwesomeIcons.phone,
                            )),
                          ],
                        ),
                        Divider(
                          color: Colors.white30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Container(
                                child: CardRoute(
                              cardTitle: 'Bus Tickets',
                              nextPage: 'bus',
                              icon: FontAwesomeIcons.bus,
                            )),
                            Container(
                              height: 100.0,
                              color: Colors.white30,
                              width: 0.5,
                            ),
                            new Container(
                                child: CardRoute(
                              cardTitle: 'Movie Tickets',
                              nextPage: 'recharge',
                              icon: FontAwesomeIcons.film,
                            )),
                          ],
                        ),
                        Divider(
                          color: Colors.white30,
                        ),
                      ],
                    ),
                  ),
//            Expanded(
//
////                child:  RawMaterialButton(
////
////                  splashColor: Colors.pinkAccent,onPressed: (){
////
////                  Navigator.pushNamed(context, '/spin');
////                  Navigator.pushNamed(context, SpinnerPage.id);
////                },
////                  child: Text('Lucky Spin',style: TextStyle(fontStyle: FontStyle.italic),),
////                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
////                  fillColor: Colors.yellowAccent,
////                )
//            ),
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
      splashColor: kSplashColor,
      child: Container(
        height: 150.0,
        width: 150.0,
        child: new Card(
          elevation: 0.0,
          color: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 50.0,
                ),
                new SizedBox(height: 10.0),
                new Text(
                  cardTitle,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/$nextPage');
      },
      onDoubleTap: onPressed,
    );
  }
}
