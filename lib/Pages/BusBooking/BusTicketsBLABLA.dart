import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palet/Pages/Wallet/PaymentOptions.dart';


class BusTicketsBLABLA extends StatefulWidget {
  static final String id='/busblabla';
  final String fromCity;
  final String toCity;
  final String provider;
  final String noOfTickets;
  final String age;
  final String passenger;
  final double amount;
  final Timestamp dateOfTravel;




   BusTicketsBLABLA({this.fromCity, this.toCity, this.provider, this.noOfTickets, this.age, this.passenger, this.amount, this.dateOfTravel});



  @override
  _BusTicketsBLABLAState createState() => _BusTicketsBLABLAState();
}

class _BusTicketsBLABLAState extends State<BusTicketsBLABLA> {
  String fromCity;
  String toCity;
  String provider;
  String noOfTickets;
  String age;
  String passenger;

  double amount;
  Timestamp dateOfTravel;
  int month;
  int day;
  int year;

  @override
  void initState() {


    passenger=widget.passenger;
    age=widget.age;
    noOfTickets=widget.noOfTickets;
    fromCity=widget.fromCity;
    toCity=widget.toCity;
    dateOfTravel=widget.dateOfTravel;
    provider=widget.provider;
    amount=widget.amount;

    month=dateOfTravel.toDate().month;
    day=dateOfTravel.toDate().day;
    year=dateOfTravel.toDate().year;


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FlutterTicketWidget(
          width: 350.0,
          height: 500.0,
          isCornerRounded: true,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 130.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        border: Border.all(width: 1.0, color: Colors.green),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            provider,
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          fromCity,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Icon(
                            FontAwesomeIcons.bus,
                            color: Colors.pink,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            toCity,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Bus Ticket',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: <Widget>[
                      ticketDetailsWidget(
                          'Passenger', passenger, 'Date', '$day-$month-$year'),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                        child: ticketDetailsWidget(
                            'Bus', '76836A45', 'Age', age),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0, right: 40.0),
                        child: ticketDetailsWidget(
                            'Tickets', noOfTickets, 'Seat', '21B'),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
                  child: Container(
                    width: 250.0,
                    height: 60.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('Asset/barcode.jpeg'),
                            fit: BoxFit.cover)),
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
                  child: Text(
                    '9824 0972 1742 1298',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),
                Center(
                  child: RaisedButton(

                    elevation: 4.0,
                    color: Colors.black,
                    onPressed: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return PaymentOptions(
                              amount: amount,
                            );
                          }));

                    },
                    child: Text('Confirm', style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                )
              ],
            ),
          ),

        ),
      ),
    );


  }
  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}




