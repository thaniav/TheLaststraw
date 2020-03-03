import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Expanded(
              flex: 2,
              child:
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(

                      radius: 50.0,

                    )
                  ],

                ),

              ),
            )
          ],
        )
    );
  }
}

