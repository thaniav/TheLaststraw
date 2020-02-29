import 'package:flutter/material.dart';
class Quant extends StatefulWidget {
  @override
  _QuantState createState() => _QuantState();
}

class _QuantState extends State<Quant> {
  int _counter=0;
  datachange()
  {
    setState(() {
      _counter++;
    });


  }

  @override
  Widget build(BuildContext context) {
    return datachange(

    );
  }
}
