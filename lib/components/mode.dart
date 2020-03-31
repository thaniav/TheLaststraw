import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:palet/models/user.dart';
import 'package:palet/models/uid.dart';
import 'package:provider/provider.dart';

/*class User extends StatelessWidget {
  String cardNumber;

  Firestore _firestore = Firestore.instance;

  User({this.cardNumber,});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/



class User {
  String cardNumber;

  User({this.cardNumber,});

  static Future<List<User>> getUsers() async{

    QuerySnapshot data =  await Firestore.instance.collection('accounts').document(current_user_uid).collection('cards').getDocuments();

    final cards = data.documents;

    List<User> cardNumbers = [];

    for(var card in cards){
      cardNumbers.add(User(cardNumber: card.data['cardNumber']));
      print('card number: ');
      print(card.data['cardNumber']);
    }

    return cardNumbers;
  }
}
