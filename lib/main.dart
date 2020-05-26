








import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:palet/Pages/BusBooking/BusTickets.dart';
import 'package:palet/Pages/BusBooking/TicketsList.dart';
import 'package:palet/Pages/Wallet/Add_card.dart';
import 'package:palet/Pages/BusBooking/BusTicketForm.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';
import 'package:palet/home/Homepage.dart';
import 'package:palet/Pages/mobile_recharge/MobileRecharge.dart';
import 'package:palet/Pages/BusBooking/BusTicketsBLABLA.dart';
import 'package:palet/Pages/Wallet/PaymentOptions.dart';
import 'package:palet/Pages/Wallet/choosecards.dart';

import 'package:palet/Pages/profile/ProfilePage.dart';
import 'package:palet/Pages/shopping/ShoppingPage.dart';

import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/Pages/authenticate/SignupPage.dart';

import 'package:palet/Pages/shopping/Shopping_cart.dart';
import 'package:palet/Pages/shopping/Shopping_list.dart';
import 'package:palet/Pages/shopping/creditcard.dart';
import 'package:palet/Pages/spinner/spin_home.dart';
import 'package:palet/shared/splashscreen.dart';
import 'package:palet/Pages/Wallet/wallet.dart';
import 'package:palet/Pages/wrapper.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:palet/Pages/profile/kyc.dart';
import 'package:palet/Pages/profile/changepw.dart';
import 'shared/constants.dart';
void main() => runApp(MyApp());

 class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
   @override
   Widget build(BuildContext context) {
     return StreamProvider<UserID>.value(
       value: AuthService().user,
       child: MaterialApp(
         theme: ThemeData(
          primaryTextTheme: TextTheme(

          ),
           textTheme: TextTheme(
           body1: TextStyle(
             color: Colors.white
           ),
//             body2: TextStyle(
//               color: Colors.white
//           ),
//             display1: TextStyle(
//                 color: Colors.white
//             ),
//             display2: TextStyle(
//                 color: Colors.white
//             ),
//             display3: TextStyle(
//                 color: Colors.white
//             ),
//             display4: TextStyle(
//                 color: Colors.white
//             ),

           ),
         ),


         debugShowCheckedModeBanner: false,
      home: Wrapper(),
       routes:
{
'/home': (context)=> Home(),
'/profile': (context) => ProfilePage(),
'/shopping': (context) => ShoppingPage(),
'/signup': (context) => SignUpPage(),
'/signin': (context) => SignInPage(),
'/wallet':(context) => WalletPage(),
  '/recharge':(context) => MobileRecharge(),
  BusTicketsBLABLA.id :(context) => BusTicketsBLABLA(),
  '/kyc':(context) =>KYC(),
  '/changepw':(context) =>Changepw(),
  ChooseCards.id: (context) => ChooseCards(),
addcard.id: (context) => addcard(),
  BusTicketsPage.id: (context) => BusTicketsPage(),
  PaymentOptions.id: (context) => PaymentOptions(),
  BusTicketForm.id: (context) => BusTicketForm(),
SpinnerPage.id: (context) => SpinnerPage(),
  TicketsList.id: (context) => TicketsList(),
  Newcart.id: (context) => Newcart(),





}

       ),
     );
   }
}


