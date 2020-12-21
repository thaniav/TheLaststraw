import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palet/home/Homepage.dart';
import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/Pages/authenticate/authenticate.dart';
import 'package:palet/Pages/authenticate/Verification.dart';
import 'package:palet/models/user.dart';

import 'package:provider/provider.dart';


class Wrapper extends StatefulWidget {

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool verified;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID>(context);
    final _auth = FirebaseAuth.instance;
   checkEmailVerified() async {
     try {
       FirebaseUser u = await _auth.currentUser();

       if (u.isEmailVerified) {
         setState(() {
           verified = true;
         });
       }
       else {
         setState(() {
           verified = false;
         });
       }
     }
     catch(e){
       print(e.toString());
     }
    }

    checkEmailVerified();

    if(user==null){
      print(checkEmailVerified());
      return Authenticate();

    }

    else{
        return Home();
    }



  }
}
