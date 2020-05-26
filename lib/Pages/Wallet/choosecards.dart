import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';
import 'package:palet/Pages/Wallet/Add_card.dart';
import 'package:palet/Pages/mobile_recharge/MobileRecharge.dart';
import 'package:palet/Pages/Wallet/PaymentOptions.dart';
import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/components/PalletButton.dart';
import 'package:palet/components/CreditCard.dart';
import 'package:palet/shared/loading.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

class ChooseCards extends StatefulWidget {
  static final String id = 'choosecards';
  final String password;
  final double updateValue;

  ChooseCards({this.updateValue, this.password});

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
              final cardWidget = CardWidget(
                Name: card.name,
                number: card.number,
                expiry: card.exp,
                cvv: card.cvv,
                update: widget.updateValue,
                add: true,
              );
              cardNumbers.add(cardWidget);
            }

            return Scaffold(
              appBar: AppBar(
                backgroundColor: kMainColor,
                elevation: 0.0,
                title: Text('Choose card'),
              ),
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: cardNumbers.isEmpty
                          ? [
                              Center(
                                child: Container(
                                  height: 500.0,
                                  width: 300.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 5, 10, 5),
                                        child: Text(
                                          'No cards added yet',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.grey,
                                              fontFamily: "PatuaOne"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ]
                          : cardNumbers,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: PalletButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return addcard(
                            updateValue: widget.updateValue,
                          );
                        }));
                      },
                      height: 40.0,
                      label: 'Add Card',
                    ),
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
