








import 'package:flutter/material.dart';
import 'package:palet/Pages/Homepage.dart';
import 'package:palet/Pages/ProfilePage.dart';
import 'package:palet/Pages/Shopping_cart.dart';
import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/Pages/authenticate/SignupPage.dart';
import 'package:palet/Pages/Shopping_cart.dart';
import 'package:palet/Pages/payment.dart';
import 'package:palet/Pages/wallet.dart';
import 'package:palet/Pages/wrapper.dart';



void main()
{
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner:false,
        home: Home(),
        routes:
          {
            '/home': (context)=> Home(),
            '/profile': (context) => ProfilePage(),
            '/shopping': (context) => Shoppingcart(),
            '/signup': (context) => SignUpPage(),
            '/signin': (context) => SignInPage(),
            '/pay':(context) => Payment(),
            '/wallet':(context) => WalletPage(),


          }

      )
  );
}
