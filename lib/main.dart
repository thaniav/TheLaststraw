








import 'package:flutter/material.dart';
import 'package:palet/Pages/Homepage.dart';
import 'package:palet/Pages/profile/ProfilePage.dart';
import 'package:palet/Pages/shopping/ShoppingPage.dart';

import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/Pages/authenticate/SignupPage.dart';

import 'package:palet/Pages/payment.dart';
import 'package:palet/Pages/shopping/Shopping_cart.dart';
import 'package:palet/Pages/shopping/Shopping_list.dart';
import 'package:palet/Pages/splashscreen.dart';
import 'package:palet/Pages/wallet.dart';
import 'package:palet/Pages/wrapper.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:provider/provider.dart';



void main() => runApp(MyApp());

 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return StreamProvider<UserID>.value(
       value: AuthService().user,
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
       home: Wrapper(),
       routes:
{
'/home': (context)=> Home(),
'/profile': (context) => ProfilePage(),
'/shopping': (context) => ShoppingPage(),
'/signup': (context) => SignUpPage(),
'/signin': (context) => SignInPage(),
'/pay':(context) => Payment(),
'/wallet':(context) => WalletPage(),


}
       ),
     );
   }
 }


