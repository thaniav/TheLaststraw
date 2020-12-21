import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:palet/services/database.dart';

import '../../shared/constants.dart';

class ForgotPass extends StatefulWidget {
  static String id = '/frgotp';
  final String email;
  final bool fromProfile;

  ForgotPass({this.email, this.fromProfile});

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String email = '';
bool fromProfile=false;
  @override
  void initState() {
    email = widget.email;
    fromProfile=widget.fromProfile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[100],
        elevation: 0.0,
      ),
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
                  'Password Reset',style: new TextStyle(
                  fontFamily: "PatuaOne",
                  fontSize: 20.0,
                  color: Colors.black
                ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 5, 10, 5),
                  child: Text(
                    'Enter your email to send password reset link',
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey,
                        fontFamily: "PatuaOne"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                      initialValue: widget.email,
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                        ),
                      ),
                      onChanged: (val) {
                        setState(() => email = val);
                      }),
                ),
                Container(
                  height: 30.0,
                  width: 200.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.greenAccent,
                    color: kSecondaryColor,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () async {
                        _auth.sendPasswordResetEmail(email: email);
                      },
                      child: Center(
                          child: Text(
                        'Send Password Reset Link',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
//                Card(
//                  child: Padding(
//                    padding: const EdgeInsets.all(8.0),
//                    child: InkWell(
//                      onTap: () {
//                        Navigator.pop(context);
//                      },
//                      child: Text(
//                        'Go Back',
//                        style: TextStyle(
//                          fontFamily: 'PatuaOne',
//                          color: Colors.grey
//                        ),
//                      ),
//                    ),
//                  ),
//                ),
              ],
            ),
          ),
        ));
  }
}
