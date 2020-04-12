
import 'package:flutter/material.dart';
import 'package:palet/Pages/Card_list.dart';

import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';

import 'package:provider/provider.dart';

class paymenthaha extends StatefulWidget {
  @override
  _paymenthahaState createState() => _paymenthahaState();
}

class _paymenthahaState extends State<paymenthaha> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<CardData>>.value(
      value: DatabaseService().cardData,
      child:CardList()

        ,
    );
  }
}
