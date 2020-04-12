import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:palet/Pages/Add_card.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ChooseCards extends StatefulWidget {
  static final String id = 'choosecards';
  final int updateValue;

  const ChooseCards({this.updateValue});
  @override
  _ChooseCardsState createState() => _ChooseCardsState();
}

class _ChooseCardsState extends State<ChooseCards> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardData>>(
        stream: DatabaseService(uid: current_user_uid).cardData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<CardData> cardData = snapshot.data;
            List<CardWidget> cardNumbers = [];
            for (var card in cardData) {
              final cardNumber = card.number;
              final cardExpiry = card.exp;
              final cardName = card.name;

              final cardWidget = CardWidget(
                Name: card.name,
                number: card.number,
                expiry: card.exp,
                update: widget.updateValue,
              );
              cardNumbers.add(cardWidget);
            }

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
                      child: Center(
                          child: Text(
                        'Add Card',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, addcard.id);
                    },
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

class CardWidget extends StatefulWidget {
  final String Name;
  final String expiry;
  final String number;
  final int update;
  CardWidget({this.Name, this.expiry, this.number, this.update});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int balance;
  String email;


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<WalletData>(
        stream: DatabaseService(uid: current_user_uid).walletData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WalletData walletData = snapshot.data;
            return Container(
              child: InkWell(
                child: CreditCardWidget(
                  cardNumber: widget.number,
                  expiryDate: widget.expiry,
                  cardHolderName: widget.Name,
                  cvvCode: '0',
                  showBackView: false,
                ),
                onTap: () async {
                  if(widget.update!=0) {
                    Alert(
                        context: context,
                        title: "Verify Email",
                        content: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: 'Enter Email',

                              ),

                              onChanged: (val){

                                email=val;
                              },

                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            onPressed: () async {
                              Navigator.pop(context);

                              await DatabaseService(uid: current_user_uid)
                                  .updateUserBalance(balance);
                              FirebaseUser user = await FirebaseAuth.instance.currentUser();



                              if(user.email==email)
                              {
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: "Added Successfully",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "COOL",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        setState(() {
                                          balance = walletData.balance + widget.update;
                                        });
                                        await DatabaseService(uid: current_user_uid).updateUserBalance(balance);

                                        },
                                      width: 120,
                                    )
                                  ],
                                ).show();

                              }

                              else{
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "Transaction Failed",
                                  desc: "Wrong Credentials",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Okay",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();

                              }

                            },
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ]).show();
                  }
                },
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
