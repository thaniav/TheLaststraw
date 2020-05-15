import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:palet/Pages/Add_card.dart';
import 'package:palet/Pages/authenticate/SignInPage.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CardWidget extends StatefulWidget {
  final String Name;
  final String expiry;
  final String number;
  final String cvv;
  final bool add;

  final double update;
  CardWidget(
      {this.Name, this.expiry, this.number, this.update, this.cvv, this.add});

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  double balance;
  String password;

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
                  cvvCode: widget.cvv,
                  showBackView: false,
                ),
                onTap: () async {

                  if (widget.add) {
                    if (widget.update != 0) {
                      Alert(
                          context: context,
                          title: "Enter CVV",
                          content: Column(
                            children: <Widget>[
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  labelText: 'CVV',
                                ),
                                onChanged: (val) {
                                  password = val;
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
                                FirebaseUser user =
                                    await FirebaseAuth.instance.currentUser();

                                if (password == widget.cvv) {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content: Container(
                                          height: 50.0,
                                          child:
                                              Text("Transaction Sucessful!")),
                                      backgroundColor: Colors.green,
                                      duration: Duration(
                                        seconds: 5,
                                      ),
                                    ),
                                  );

                                  setState(() {
                                    balance =
                                        walletData.balance + widget.update;
                                  });

                                  await DatabaseService(uid: current_user_uid)
                                      .updateUserBalance(balance);

                                  Navigator.pop(context);
                                } else {
                                  print(password);
                                  print(widget.cvv);
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Transaction Failed",
                                    desc: "Wrong Credentials",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Okay",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          print(p);
                                          print(password);
                                          print(balance);
                                          await DatabaseService(
                                                  uid: current_user_uid)
                                              .updateUserBalance(
                                                  walletData.balance);
                                        },
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
                  }
                  else{
                    if (password == widget.cvv) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Container(
                              height: 50.0,
                              child:
                              Text("Transaction Sucessful!")),
                          backgroundColor: Colors.green,
                          duration: Duration(
                            seconds: 5,
                          ),
                        ),
                      );


                      Navigator.pop(context);
                    } else {

                      Alert(
                          context: context,
                          title: "Enter CVV",
                          content: Column(
                            children: <Widget>[
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  labelText: 'CVV',
                                ),
                                onChanged: (val) {
                                  password = val;
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
                                FirebaseUser user =
                                await FirebaseAuth.instance.currentUser();

                                if (password == widget.cvv) {
                                  Alert(
                                    context: context,
                                    type: AlertType.success,
                                    title: "Payment Successful",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Okay",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () async  {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          await DatabaseService(
                                              uid: current_user_uid)
                                              .updateUserBalance(
                                              walletData.balance);
                                        },
                                        width: 120,
                                      )
                                    ],
                                  ).show();
                                } else {

                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "Transaction Failed",
                                    desc: "Wrong CVV",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Okay",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await DatabaseService(
                                              uid: current_user_uid)
                                              .updateUserBalance(
                                              walletData.balance);

                                        },
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
