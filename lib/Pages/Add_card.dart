
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
void main() => runApp(MaterialApp(
  home:addcard(),
));

class addcard extends StatefulWidget {
  static final String id='addcard';
  final double updateValue;

  addcard({this.updateValue});

  @override
  _addcardState createState() => _addcardState();
}

class _addcardState extends State<addcard> {
  String walletID = '';
  double balance=0;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool _value1=false;
  bool isValidate=false;

  Firestore _firestore = Firestore.instance;

  void _value1Changed(bool value) => setState(() =>  _value1 = value);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID>(context);
    return StreamBuilder<WalletData>(
      stream:
        DatabaseService(uid: user.uid).walletData,
      builder: (context, snapshot) {
        WalletData walletData = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title:Text('Add Card'),
          ),
          resizeToAvoidBottomPadding: false,
          body:Column(
            children: <Widget>[
              ExpansionTile(
                trailing: Icon(Icons.credit_card),
                title:Text('Debit card',
                  style:TextStyle(
                    color:Colors.black,
                    fontWeight: FontWeight.w500,
                  ),),
                children: <Widget>[
                  CreditCardForm(
                    onCreditCardModelChange: onCreditCardModelChange,
                  ),

                  Container(
                    padding:EdgeInsets.only(top:0.0,left:20.0,right:20.0),
                    child:Column(
                      children: <Widget>[


                        SizedBox(height:2.0),
                        Container(
                          child:CheckboxListTile(
                            value:_value1,
                            onChanged:_value1Changed,
                            title:new Text('Remember card'),
                            controlAffinity:ListTileControlAffinity.leading,

                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: new RaisedButton(

                            onPressed: () async {
                            FirebaseUser user = await FirebaseAuth.instance.currentUser();
                            if(_value1==true) {
                              _firestore
                                  .collection('accounts')
                                  .document(user.uid)
                                  .collection('cards')
                                  .add({
                                'cardNumber': cardNumber,
                                'cardExpiry': expiryDate,
                                'cardHolderName': cardHolderName,
                                'cvv': cvvCode,
                              });
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "New Card Added",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Okay",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                    },

                                    width: 120,
                                  )
                                ],
                              ).show();
                              setState(()  {
                                balance=walletData.balance+widget.updateValue;
                              });
                              await DatabaseService(uid: current_user_uid).updateUserBalance(balance);

                              }


                            else{
                              setState(()  {
                                balance=walletData.balance+widget.updateValue;
                              });
                              print(balance);
                              await DatabaseService(uid: current_user_uid).updateUserBalance(balance);
                              Alert(
                                context: context,
                                type: AlertType.success,
                                title: "Added successfully",
                                buttons: [
                                  DialogButton(
                                    child: Text(
                                      "Okay",
                                      style: TextStyle(color: Colors.white, fontSize: 20),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pop(context);

                                    },

                                    width: 120,
                                  )
                                ],
                              ).show();
                            }
                          },
                            color:Colors.green,

                            child:new Text('Pay'),),
                        )

                      ],
                    ),
                  ),

                ],
              ),

//
            ],
          ),
        );
      }
    );
  }
  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;

      if(cardNumber.isNotEmpty && expiryDate.isNotEmpty && cardHolderName.isNotEmpty && cvvCode.isNotEmpty ) {
        print("Validated");
        isValidate=true;
      }

    });

  }
}
