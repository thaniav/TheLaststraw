import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:palet/services/database.dart';

import '../../shared/constants.dart';

class Verification extends StatelessWidget {
  FirebaseAuth _auth= FirebaseAuth.instance;

    @override

  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(

      ),
      child: Scaffold(
          backgroundColor: Colors.blueGrey[100],

          body: Center(
            child: Container(
              height: 300.0,
              width: 300.0,
              color: Colors.white,

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'WELCOME !',style: new TextStyle(
                    fontFamily: "PatuaOne",
                    fontSize: 20.0,
                  ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,5, 10, 5),
                    child: Text('Thanks for signing up! We just need you to verify your email address to complete setting up your account.',
                      style: TextStyle(fontSize: 15.0,color: Colors.grey,fontFamily: "PatuaOne"),),
                  ),
                  Container(
                    height:30.0,
                    width: 200.0,
                    child: Material(
                      borderRadius:BorderRadius.circular(20.0),
                      shadowColor:Colors.greenAccent,
                      color: kSecondaryColor,
                      elevation:7.0,
                      child: GestureDetector(

                        onTap: ()async{
                          FirebaseUser user = await _auth.currentUser();
                          user.sendEmailVerification();


                                      },
                        child: Center(child: Text('Send Verification Email',style: TextStyle(color:Colors.white),)),
                      ),
                    ),
                  ),

                  IconButton(
                    icon: Icon(Icons.add_to_home_screen),
                    color: Colors.black,
                    onPressed: () async{
                      FirebaseUser user = await _auth.currentUser();
                      _auth.signOut();

                    },
                  ),
                ],
              ),

            ),
          )



      ),
    );
  }
}