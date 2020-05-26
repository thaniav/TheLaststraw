import 'package:flutter/material.dart';
import 'package:palet/Pages/Wallet/PaymentOptions.dart';

import 'package:palet/components/PalletButton.dart';
import 'package:palet/shared/loading.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';

class MobileRecharge extends StatefulWidget {
  @override
  _MobileRechargeState createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  double getBillAmount(String provider) {
    if (provider == 'Vodafone') {
      return 400;
    }
    if (provider == 'Airtel') {
      return 500;
    }
    if (provider == 'Jio') {

      return 300;

    } else
      return 0;
  }

  String initial = 'Choose provider';
  double billAmount = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: current_user_uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Scaffold(
              backgroundColor: kMainColor,
                appBar: AppBar(
                  elevation: 0.0,

                  centerTitle: true,
                  title: Text(
                    'Mobile Recharge',
                    style: TextStyle(fontFamily: 'PatuaOne'),
                  ),
                backgroundColor: kMainColor,
                ),
                body: Container(
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 60.0,

                          child: DropdownButtonFormField(


                            decoration: new InputDecoration(
                              filled: true,

                              labelText: initial,
                              fillColor: Colors.white30,
                              focusColor: Colors.teal,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                ),
                              ),


                              labelStyle: TextStyle(color: Colors.grey[800]),

                              //fillColor: Colors.green
                            ),
                            items: [
                              DropdownMenuItem(
                                child: Text('Vodafone'),
                                value: 'Vodafone',
                              ),
                              DropdownMenuItem(
                                child: Text('Airtel'),
                                value: 'Airtel',
                              ),
                              DropdownMenuItem(
                                child: Text('Jio'),
                                value: 'Jio',
                              ),
                            ],
                            onChanged: (val) {
                              setState(() {
                                getBillAmount(val);
                                initial = val;
                              });
                              setState(() {
                                billAmount=getBillAmount(val);
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 20.0,),
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            maxLength: 10,
                            keyboardType: TextInputType.number,
                            initialValue: userData.phone,
                            decoration: new InputDecoration(
                              filled: true,
                              labelText: "Enter Phone number",
                              fillColor: Colors.white30,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              labelStyle: TextStyle(color: Colors.grey[800]),

                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.green,
                                ),
                              ),

                              //fillColor: Colors.green
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 300.0,
width: 300.0,
child: Card(
  child: Text('Bill amount '+billAmount.toString(),
  style: TextStyle(
    color: Colors.black
  ),),

),
                          ),
                        ),
                        SizedBox(height: 50.0,),

                        Expanded(
                          flex: 1,
                          child: Container(

                            child: PalletButton(
                              label: 'Proceed to pay',
                              height: 10.0,
                              onPressed: (){
                                if (billAmount != 0) {
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return PaymentOptions(amount: billAmount,);
                                  }));
                                } else {}
                              },
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                ));
          } else {
            return Loading();
          }
        });
  }
}
