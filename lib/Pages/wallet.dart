import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        WalletData walletData = snapshot.data;
         balance=walletData.balance;
        return Scaffold(
          appBar: AppBar(
            title:Text('                               Wallet    '),
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 20, 0, 100),
            brightness:Brightness.dark,
            textTheme:TextTheme(
              title:TextStyle(
                  color: Colors.white,
                  fontSize:20.0
              ),
            ),
          ),
          body:Container(
            width:MediaQuery.of(context).size.width,
            child:SingleChildScrollView(
              child:Column(
                children: <Widget>[
                  Container(
                    padding:EdgeInsets.only(bottom:10,),
                    decoration:BoxDecoration(
                      color:Color.fromARGB(255, 20, 0, 100),
                      borderRadius:BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),

                      ),
                    ),
                    child:Container(

                        child:Column(
                          children: <Widget>[
                            Container(
                              margin:EdgeInsets.symmetric(horizontal:20,vertical:10,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Current Balance",
                                      style:TextStyle(
                                        color: Colors.white,
                                        fontSize:18,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              margin:EdgeInsets.symmetric(horizontal:20,vertical:10,),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('$balance' ,
                                      style:TextStyle(
                                        color: Colors.white,
                                        fontSize:30,
                                      )),

                                ],
                              ),
                            ),
                          ],
                        ),
                        margin:EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        height:200,
                        decoration:BoxDecoration(
                            borderRadius:BorderRadius.circular(16),
                            gradient:LinearGradient(
                                colors:[
                                  Color(0xFFe67e22),
                                  Color(0xFFf1c40f),

                                ]
                            )
                        )
                    ),
                  ),

                  Container(
                    padding:EdgeInsets.fromLTRB(10.0, 100.0,220.0,10.0),
                    child:Column(
                      children: <Widget>[
                        TextFormField(
                          decoration:InputDecoration(
                            labelText:'ADD MONEY',
                            labelStyle: TextStyle(
                              fontSize: 27.0,fontWeight: FontWeight.bold,
                              color:Colors.black,
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.green),
                            ),
                          ),
                          onChanged: (val){
                            setState(()
                            => update = int.parse(val));
                            print(val);
                          },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height:30.0,),
                  Container(
                    height: 40.0,
                    child:Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor:Colors.greenAccent,
                        color:Colors.green,
                        elevation: 7.0,
                        child:GestureDetector(
                          onTap:() async {
                            setState(() {
                              balance = balance + update;
                            });
                            FirebaseUser user = await FirebaseAuth.instance.currentUser();
                            await DatabaseService(uid: user.uid).updateUserBalance(walletID, balance);
                            setState(() {
                              update = 0;
                            });
                            print(balance);
                            Navigator.pushNamed(context,'/payment');
                          },
                          child:Center(
                            child:Text(
                              'Proceed to Add',
                              style:TextStyle(
                                  color:Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'
                              ),
                            ),
                          ),
                        )
                    ),
                  ),
                ],

              ),

            ),

          ),
        );
      }
    );
  }
}