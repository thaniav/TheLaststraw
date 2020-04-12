import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palet/Pages/choosecards.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/components/mode.dart';
import 'package:palet/constants.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';


class WalletPage extends StatefulWidget {
  final AuthService _auth = AuthService();
  @override
  _WalletPageState createState() => _WalletPageState();
}


class _WalletPageState extends State<WalletPage> {
  String walletID='';
  int balance = 0;
  int update = 0;




  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserID>(context);


    return StreamBuilder<WalletData>(
      stream: DatabaseService(uid: user.uid).walletData,
      builder: (context, snapshot) {
    if(snapshot.hasData) {
      WalletData walletData = snapshot.data;
      balance = walletData.balance;
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Wallet'),
          elevation: 0,
          backgroundColor: kPalletColor,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            title: TextStyle(
                color: Colors.white,
                fontSize: 20.0
            ),
          ),
        ),
        body: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: SingleChildScrollView(
            child: Column(

              children: <Widget>[
                SizedBox(height: 20.0,),
                Container(
                  padding: EdgeInsets.only(bottom: 10,),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),

                    ),
                  ),
                  child: Container(

                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Current Balance",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    )),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text('$balance',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    )),

                              ],
                            ),
                          ),

                        ],
                      ),
                      margin: EdgeInsets.all(20),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              colors: [
                                Colors.redAccent,
                                Colors.yellowAccent

                              ]
                          )
                      )
                  ),

                ),
                Divider(
                  color: Colors.grey,

                  endIndent: 40.0,
                  indent: 40.0,

                ),

                SizedBox(height: 30.0,),


                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  child: TextField(
                    decoration: new InputDecoration(
                      labelText: "Add Money",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.grey,
                          style: BorderStyle.solid,

                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.grey[800]),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.green,
                        ),
                      ),


                      //fillColor: Colors.green
                    ),
                    onChanged: (val) {
                      setState(() => update = int.parse(val));
                      print(val);
                    },

                  ),
                ),

                SizedBox(height: 30.0,),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          colors: [Colors.teal, Colors.teal],
                        )),
                    margin: EdgeInsets.only(top: 50.0),
                    width: double.infinity,
                    height: 50.0,
                    child: Center(child: Text('Proceed to add',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                      ),)),
                  ),
                  onTap: () {

                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return ChooseCards(updateValue: update,);
                    }));
                  }
                  ,

                ),

              ],

            ),

          ),

        ),
      );
    }
    else{
      return Loading();
    }
      }
    );
  }
}