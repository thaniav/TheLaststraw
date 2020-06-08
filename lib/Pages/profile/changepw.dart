import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palet/Pages/authenticate/forgotPassword.dart';
import 'package:palet/Pages/authenticate/forgotPw.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';

import '../../shared/constants.dart';
class Changepw extends StatefulWidget {
  final String email;

  Changepw({this.email});

  @override
  _ChangepwState createState() => _ChangepwState();
}

class _ChangepwState extends State<Changepw> {
  final _formKey = GlobalKey<FormState>();
  String password='';
  String confirmPassword='';
  String currentPassword='';
  @override
  Widget build(BuildContext context) {
    print("password"+p);


    return  Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Row(
          children: <Widget>[
            Text(
              'Change Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                fontFamily: 'sans-serif-light',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body:ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left:50.0,right: 50.0),
            child:Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100.0,),
                  TextFormField(
                    validator: (val) => p!=val ? 'Incorrect password': null,
                    decoration: InputDecoration(

                      hintText: 'old Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        color:Colors.grey,
                      ),
                    ),
                    onChanged: (val){
                      setState(() {
                        currentPassword=val;

                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    validator: (val) => val.length<6? 'Enter a password 6+ chars long': null,
                    decoration: InputDecoration(

                      hintText: 'new Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        color:Colors.grey,
                      ),
                    ),
                    onChanged: (val){
                      setState(() {
                        password=val;

                      });
                    },
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFormField(
                    validator: (val) => password!=confirmPassword? 'Passwords do not match': null,
                    decoration: InputDecoration(

                      hintText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        color:Colors.grey,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (val){
                      setState(() {
                        confirmPassword=val;

                      });
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),

                  InkWell(
                    onTap: () async{
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ForgotPass(fromProfile: true,email: widget.email.trim(),);
                      }));
                      },
                    child: Text(
                      'Forgot Password?',

                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                      ),

                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),

                  Container(
                    height:40.0,

                    child: Material(

                      borderRadius:BorderRadius.circular(20.0),
                      shadowColor:Colors.greenAccent,
                      color: kSecondaryColor,
                      elevation:7.0,
                      child:GestureDetector(
                        // not exactly the same as video
                        onTap:() async {

                          FirebaseUser user =
                          await FirebaseAuth.instance.currentUser();

                          if(_formKey.currentState.validate()) {

                            if (password != null) {
                              //Pass in the password to updatePassword.
                              user.updatePassword(password).then((_) {
                                print("Succesfull changed password");
                              }).catchError((error) {
                                print("Password can't be changed" +
                                    error.toString());
                                //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
                              });
                            }
                          }

                        },
                        child:Center(
                          child:Text(

                            'Confirm',
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


                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
