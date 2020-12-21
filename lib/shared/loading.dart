import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:palet/shared/constants.dart';

class Loading extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Container(
      color: kMainColor,
      child:
        Center(
          child: SpinKitRipple(
            color: Colors.white,
            size: 350.0,
            borderWidth: 100.0,
          )

    )



    );
  }
}
