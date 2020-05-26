import 'package:flutter/material.dart';

import '../shared/constants.dart';


class PalletButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final double height;
  final double width;

  PalletButton({this.onPressed, this.label, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(

      height:height,
      width: width,
      child:Material(

        borderRadius:BorderRadius.circular(20.0),
        shadowColor:Colors.greenAccent,
        color: kSecondaryColor,
        elevation:7.0,
        child:GestureDetector(
          // not exactly the same as video
          onTap: onPressed,
          child:Center(
            child:Text(

              label,
              style:TextStyle(
                  color:Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily:'Montserrat'
              ),
            ),
          ),
        ),
      ),
    );
  }
}
