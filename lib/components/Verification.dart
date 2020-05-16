import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:palet/services/database.dart';

class Verification extends StatelessWidget {
  FirebaseAuth _auth= FirebaseAuth.instance;

    @override

  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child:
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: ()async{
                    FirebaseUser user = await _auth.currentUser();
                    user.sendEmailVerification();


                                },
                  child: Text('Send Verification Email'),
                ),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: ()async{
                    FirebaseUser user = await _auth.currentUser();
                    _auth.signOut();


                  },
                  child: Text('Logout'),
                ),


              ],
            )

        )



    );
  }
}