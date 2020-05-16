import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palet/Pages/Homepage.dart';
import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/Pages/authenticate/authenticate.dart';
import 'package:palet/components/Verification.dart';
import 'package:palet/models/user.dart';

import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {

  bool verified;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID>(context);
    final _auth = FirebaseAuth.instance;
   checkEmailVerified() async {
      FirebaseUser u = await _auth.currentUser();
      if(u.isEmailVerified){
        verified= true;
      }
      else{
        verified= false;
      }
    }
    checkEmailVerified();

    if(user==null){
      print(checkEmailVerified());
    return Authenticate();

    }

    else if(verified==false){
      print(checkEmailVerified());
      print('Entered this one');

      return Verification();
    }

    else{
      print('Home');
      print(verified);
      return Home();
    }

  }
}
