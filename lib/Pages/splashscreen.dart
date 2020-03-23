import 'dart:async';

import 'package:flutter/material.dart';
import 'package:palet/Pages/wrapper.dart';
import 'package:palet/main.dart';
import 'package:palet/models/user.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {





  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID>(context);

    return Scaffold(
      body:
        Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.green,

              ),

            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('Asset/logo.jpeg'),
                    radius: 100.0,
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Your personal wallet",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,

                    fontStyle: FontStyle.italic

                  ),
                ),
                SizedBox(height: 50.0),
                CircularProgressIndicator(
                  backgroundColor: Colors.green[800],

                ),

              ],



            ),





          ],
        )
    );
  }
}

