import 'package:flutter/material.dart';
import 'package:palet/Pages/Homepage.dart';
import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/Pages/authenticate/authenticate.dart';
import 'package:palet/models/user.dart';

import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID>(context);
    print(user);
    if(user==null){
      return Authenticate();

    }
    else{
      return Home();
    }
  }
}
