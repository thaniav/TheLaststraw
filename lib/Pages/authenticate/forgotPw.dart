import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palet/home/Homepage.dart';
import 'package:palet/Pages/authenticate/SignupPage.dart';
import 'package:palet/Pages/Wallet/choosecards.dart';
import 'package:palet/shared/loading.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/services/auth.dart';






class ForgotPW extends StatefulWidget {
  static String id= '/frgotpw';

final String email;

   ForgotPW({this.email});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ForgotPW> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _formKey= GlobalKey<FormState>();
  bool loading = false;
  String email;
@override
  void initState() {
  email=widget.email;
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomPadding: false,


      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child:Stack(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.fromLTRB(15.0, 110.0,0.0,0.0),
                  child:Text(
                    'Reset Password',
                    style:TextStyle(
                        color: kMainColor,
                        fontSize:80.0,fontWeight:FontWeight.bold,
                        fontFamily: 'PatuaOne'),

                  ),
                ),

              ],
            ),
          ),
          Container(
            padding:EdgeInsets.only(top:35.0,left:20.0,right:20.0),
            child: Form(
              key: _formKey,
              child:Column(
                children: <Widget>[
                  TextFormField(
                    initialValue: email,
                      validator: (val) => val.isEmpty? 'Enter an email': null,
                      decoration: InputDecoration(

                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),

                      ),

                      onChanged: (val){
                        setState(()
                        => email = val
                        );
                      }
                  ),

                  SizedBox(height:20.0,),

                  SizedBox(height:5.0),

                  SizedBox(height:40.0),
                  Container(
                    height:40.0,
                    child:Material(

                      borderRadius:BorderRadius.circular(20.0),
                      shadowColor:Colors.greenAccent,
                      color: kSecondaryColor,
                      elevation:7.0,
                      child:GestureDetector(
                        // not exactly the same as video
                        onTap:() async {
                          if(_formKey.currentState.validate()){
                            setState(() => loading = true);

                          }
                          await _firebaseAuth.sendPasswordResetEmail(email: email);
                     showDialog(context: context,
                     builder: (BuildContext context){
                       return AlertDialog(
                         title: Text("Password Reset"),
                         content: Text(
                           'Check your email to reset password'
                         ),
                         actions: <Widget>[
                           RaisedButton(
                             child: Text(
                               'OK'
                             ),
                             onPressed: (){
                               Navigator.pop(context );
                             },
                           )
                         ],
                       );
                     }
                     );




                        },
                        child:Center(
                          child:Text(

                            'Send Reset Link',
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
                  SizedBox(height:20.0),
                ],
              ),
            ),
          ),
          SizedBox(height:10.0),


          SizedBox(height:30.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Text(
                  'Go back',
                  style:TextStyle(
                    color: kMainColor,
                    fontFamily: 'PatuaOne',
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(width :5.0),




            ],

          )
        ],

      ),

    );
  }
}




