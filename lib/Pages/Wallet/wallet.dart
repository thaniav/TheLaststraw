import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palet/Pages/Wallet/choosecards.dart';
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
  double balance = 0;
  double update = 0;




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
        backgroundColor: kMainColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Wallet'),
          elevation: 0.0,
          backgroundColor: kMainColor,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            title: TextStyle(
                color: Colors.white,
                fontSize: 20.0
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height - 10.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
            BorderRadius.only(topLeft: Radius.circular(110.0), topRight: Radius.circular(110.0), bottomLeft: Radius.circular(110.0), bottomRight: Radius.circular(110.0) ),
          ),
          child: SingleChildScrollView(
            child: Column(

              children: <Widget>[
                SizedBox(height: 20.0,),
                Container(


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
                      width: 250.0,
                      height: 150,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              colors: [
                                kSecondaryColor, kPinkColor

                              ]
                          ),
                        backgroundBlendMode: BlendMode.darken
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
                    keyboardType: TextInputType.number,
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
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
                      setState(() => update =double.parse(val));
                      print(val);
                    },

                  ),
                ),

                SizedBox(height: 70.0,),

                    Container(
                      height:40.0,
                      width: 300.0,
                      child:Material(

                        borderRadius:BorderRadius.circular(20.0),
                        shadowColor:Colors.greenAccent,
                        color: kSecondaryColor,
                        elevation:7.0,
                        child:GestureDetector(
                          // not exactly the same as video
                          onTap:() {

                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return ChooseCards(updateValue: update,);
                            }));

                          },
                          child:Center(
                            child:Text(

                              'Proceed to Add',
                              style:TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily:'Montserrat'
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


SizedBox(height: 10.0,)




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