import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:palet/Cardtile.dart';
import 'package:palet/Pages/Add_card.dart';
import 'package:palet/Pages/Card_list.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/components/mode.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';
import 'package:palet/models/uid.dart';
import 'package:provider/provider.dart';
class paymenthaha extends StatefulWidget {
  @override

  _paymentState createState() => _paymentState();
}

class _paymentState extends State<paymenthaha> {


  @override

  Widget build(BuildContext context) {
  
    return StreamProvider<List<CardData>>.value(
      value: DatabaseService(uid: current_user_uid).cardData,
    child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment methods'),
      ),
      body: CardList(),

    ),
    );
  }

}
