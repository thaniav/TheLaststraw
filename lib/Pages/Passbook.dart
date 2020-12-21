import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/shared/loading.dart';




class Passbook extends StatefulWidget {
  static String id='/passbook';
  @override
  _PassbookState createState() => _PassbookState();
}

class _PassbookState extends State<Passbook> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TransactionData>>(
      stream: DatabaseService(uid: current_user_uid).transactionData,
      builder: (context, snapshot) {

     if(snapshot.hasData)   {

       List<TransactionData> transactionData = snapshot.data;
       List<TransactionCard> passbook = [];
       for (var transaction in transactionData) {
         final cardWidget = TransactionCard(
        type: transaction.type,
           amount: transaction.amount,
           time: transaction.time,
         );
         passbook.add(cardWidget);
       }

    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      elevation: 0.0,
    title: Text('Passbook'),
    ),
    body: ListView(
    children: passbook,
    )

    );
    }
    else {return Scaffold(
       backgroundColor: kMainColor,
       appBar: AppBar(
         elevation: 0.0,
         title: Text('Passbook'),
       ),
       body: Container(
         child: Text('No Transactions yet'),
       ),
     );}

      }
    );
  }
}

class TransactionCard extends StatelessWidget {
  final String type;
  final Timestamp time;
  final double amount;


  TransactionCard(
      {this.amount, this.type, this.time });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Container(
        height: 80.0,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:   new Container(

                      width: 40.0,
                      height: 40.0,
                      decoration: new BoxDecoration(

                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: new AssetImage('Asset/palletIcon.png'),
                          fit: BoxFit.cover,
                        ),
                      )),
                )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    type,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  Text(
                    this.time.toDate().toString(),
                    style: TextStyle(fontSize: 12.0, color: Colors.green),
                  ),

                ],
              ),
            ),
            Container(
              height: 40.0,

              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
               child: Row(
                 children: <Widget>[
                   Text(
                     'Rs.',
                     style: TextStyle(
                       color: Colors.black
                     ),
                   ),
                   Text(
                     this.amount.toString(),
                     style: TextStyle(
                         color: Colors.black
                     ),
                   ),
                 ],
               ),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
