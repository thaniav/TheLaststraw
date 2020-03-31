import 'package:flutter/material.dart';
import 'package:palet/Cardtile.dart';
import 'package:palet/models/user.dart';
import 'package:provider/provider.dart';

class CardList extends StatefulWidget {
  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {

    final cards=Provider.of<List<CardData>>(context);

  cards.forEach((c) {
print(c.number);
    });

    return ListView.builder(

      itemCount: cards.length,
      itemBuilder: (context, index){
        return CardTile(card: cards[index]);
      }

    );
  }
}
