import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palet/Pages/Wallet/choosecards.dart';
import 'package:palet/shared/loading.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';

class WalletPage extends StatefulWidget {
  final AuthService _auth = AuthService();

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  String walletID = '';
  double balance = 0;
  double update = 0;
  var chosen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserID>(context);

    return StreamBuilder<WalletData>(
        stream: DatabaseService(uid: user.uid).walletData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            WalletData walletData = snapshot.data;
            balance = walletData.balance;
            return Scaffold(
              floatingActionButton: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: kPinkColor,
                  child: Icon(
                    Icons.cake
                  ),
                  onPressed: (){
                    Navigator.pushNamed(context, '/spin');
                  },
                ),
              ),
              backgroundColor: kMainColor,
              appBar: AppBar(
                centerTitle: true,
                title: Text('Wallet'),
                elevation: 0.0,
                backgroundColor: kMainColor,
                brightness: Brightness.dark,
                textTheme: TextTheme(
                  title: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height - 10.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(110.0),
                      topRight: Radius.circular(110.0),
                      bottomLeft: Radius.circular(110.0),
                      bottomRight: Radius.circular(110.0)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        child: Container(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("Current Balance",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('$balance',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 30,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(20),
                            width: 250.0,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                    colors: [kSecondaryColor, kPinkColor]),
                                backgroundBlendMode: BlendMode.darken)),
                      ),
                      Divider(
                        color: Colors.grey,
                        endIndent: 40.0,
                        indent: 40.0,
                      ),
                      Container(
                        height: 30.0,
                        margin: EdgeInsets.only(left: 16.0, right: 16.0),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                chosen.text = "250";

                                setState(() {
                                  update = double.parse(chosen.text);
                                });
                              },
                              child: Container(
                                width: 110.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      width: 1.0, color: Colors.green),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Rs 250',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                chosen.text = "500";
                                setState(() {
                                  update = double.parse(chosen.text);
                                });
                              },
                              child: Container(
                                width: 110.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      width: 1.0, color: Colors.blue),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Rs 500',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                chosen.text = "1000";
                                setState(() {
                                  update = double.parse(chosen.text);
                                });
                              },
                              child: Container(
                                width: 110.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  border: Border.all(
                                      width: 1.0, color: Colors.green),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      'Rs 1000',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: TextField(
                          controller: chosen,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: new InputDecoration(
                            labelText: "Add Money",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(
                                color: Colors.grey,
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
                          onChanged: (val) {
                            setState(() => update = double.parse(val));
                            print(val);
                            print(update);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 70.0,
                      ),
                      Container(
                        height: 40.0,
                        width: 300.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor: Colors.greenAccent,
                          color: kSecondaryColor,
                          elevation: 7.0,
                          child: GestureDetector(
                            // not exactly the same as video
                            onTap: () {
                              chosen.clear();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ChooseCards(
                                  updateValue: update,
                                );
                              }));
                            },
                            child: Center(
                              child: Text(
                                'Proceed to Add',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100.0,
                        width: 50.0,
                        child: ListView(
                          children: <Widget>[
                            Container(
                              height: 2.0,
                              width: 2.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
