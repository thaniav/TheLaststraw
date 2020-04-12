import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:palet/Pages/Add_card.dart';
import 'package:palet/components/mode.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';

class ChooseCards extends StatefulWidget {
  static final String id='choosecards';
  @override
  _ChooseCardsState createState() => _ChooseCardsState();
}

class _ChooseCardsState extends State<ChooseCards> {




  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardData>>(
      stream: DatabaseService(uid: current_user_uid).cardData,
      builder: (context, snapshot) {



        List<CardData> cardData=snapshot.data;
        List<CardWidget> cardNumbers=[];
        for(var card in cardData){
          final cardNumber=card.number;
          final cardExpiry=card.exp;
          final cardName=card.name;

          final cardWidget= CardWidget(Name: card.name,number: card.number,expiry: card.exp,);
          cardNumbers.add(cardWidget);


        }


        if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: Text('Choose cards'),

            ),
            body: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    children: cardNumbers,


                  ),
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          colors: [Color(0xFF3CCD94), Colors.tealAccent],
                        )),
                    margin: EdgeInsets.only(top: 50.0),
                    width: double.infinity,
                    height: 50.0,
                    child: Center(child: Text('Add Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,

                      ),)),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, addcard.id);
                  },
                ),



              ],
            ),

          );
        }
        else{
          return Scaffold();
        }
      }
    );
  }
}

class CardWidget extends StatelessWidget {

  final String Name;
  final String expiry;
  final String number;
  CardWidget({this.Name,this.expiry,this.number});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        child: CreditCardWidget(
          cardNumber: number,
          expiryDate: expiry,
          cardHolderName: Name,
          cvvCode: '0',
          showBackView: false,
        ),
        onTap: (){


        },
      ),
    );
  }
}
