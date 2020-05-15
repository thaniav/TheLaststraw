import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palet/Pages/BusBooking/BusTicketForm.dart';
import 'package:palet/Pages/BusBooking/BusTicketsBLABLA.dart';
import 'package:palet/constants.dart';

class BusTicketsPage extends StatefulWidget {
  static String id = '/bus';

  @override
  _BusTicketsPageState createState() => _BusTicketsPageState();
}

class _BusTicketsPageState extends State<BusTicketsPage> {
  var cities = [
    'Bangalore',
    'Mysore',
    'Delhi',
    'Chennai',
    'Mumbai',
    'Hyderabad',
    'Goa',
    'Kolkata',
    'Kochi',
    'Pune'
  ];
  String fromCity = 'From';
  String toCity = 'To';

  Widget image_carousel = new Container(
    height: 200.0,
    child: Carousel(
      boxFit: BoxFit.cover,
      images: [
        AssetImage('Asset/bus3.jpg'),
        AssetImage('Asset/bus4.jpg'),
        AssetImage('Asset/bus1.png'),
        AssetImage('Asset/bus2.png'),
      ],
      autoplay: false,
//       animationCurve: Curves.fastOutSlowIn,
//      animationDuration: Duration(milliseconds: 10),
      dotSize: 2.0,
      indicatorBgPadding: 2.0,
    ),
  );

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
        ),
        body: Container(
          child: SafeArea(
            child: Container(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            SizedBox(height: 50.0),
                            Text(
                              'Book',
                              style: TextStyle(
                                  fontSize: 40.0,
                                  fontFamily: 'Pacifico',
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Tickets',
                              style: TextStyle(
                                fontSize: 40.0,
                                fontFamily: 'Pacifico',
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        width: 114.0,
                        child: DropdownButtonFormField(
                          iconEnabledColor: Colors.white,
                          decoration: InputDecoration(

                            labelText: fromCity,
                            labelStyle: TextStyle(
                              color: Colors.white
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),

                        ),
                          ),
                          items: cities.map((String dropDownMenuItem) {
                            return DropdownMenuItem(
                              value: dropDownMenuItem,
                              child: Text(dropDownMenuItem),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              fromCity = val;
                            });
                          },
                        ),
                      ),
                      Container(
                        height: 50.0,
                        width: 114.0,
                        child: DropdownButtonFormField(
                          iconEnabledColor: Colors.white,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),

                            ),
                            labelText: toCity,
                            labelStyle: TextStyle(
                                color: Colors.white),
                          ),
                          items: cities.map((String dropDownMenuItem) {
                            return DropdownMenuItem(
                              value: dropDownMenuItem,
                              child: Text(dropDownMenuItem),
                            );
                          }).toList(),
                          onChanged: (val) {
                            setState(() {
                              toCity = val;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    height: MediaQuery.of(context).size.height - 250.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(110.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 5.0, 16.0),
                      child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        children: <Widget>[
                          SizedBox(
                            height: 50.0,
                          ),
                          BusWidget(
                            busProvider: "Country Line Travels and Cargo",
                            amount: 500,
                            seat: "NON A-C Seater - Sleeper (2+1)",
                            fromCity: fromCity,
                            toCity: toCity,
                          ),
                          BusWidget(
                            busProvider: "Vijay Tour and Travels",
                            amount: 650,
                            seat: "A-C, Seater Sleeper",
                            fromCity: fromCity,
                            toCity: toCity,
                          ),
                          BusWidget(
                            busProvider: "Shakti Travels",
                            amount: 385,
                            seat: "A-C, Sleeper, Volvo, Multi Axle",
                            fromCity: fromCity,
                            toCity: toCity,
                          ),
                          BusWidget(
                            busProvider: "Country Line Travels and Cargo",
                            amount: 500,
                            seat: "A-C, Seater Sleeper",
                            fromCity: fromCity,
                            toCity: toCity,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class BusWidget extends StatelessWidget {
  final String busProvider;
  final String seat;
  final double amount;
  final String fromCity;
  final String toCity;

  BusWidget({this.busProvider, this.amount, this.seat, this.fromCity, this.toCity});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                child: Icon(
                  FontAwesomeIcons.bus,
                  size: 50.0,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  busProvider,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  seat,
                  style: TextStyle(fontSize: 12.0, color: Colors.green),
                ),
                Text(
                  "₹ " + amount.toString(),
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 40.0,
            width: 60.0,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Material(
                borderRadius: BorderRadius.circular(20.0),
                shadowColor: Colors.greenAccent,
                color: kSecondaryColor,
                elevation: 1.0,
                child: InkWell(
                  onTap: () async {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BusTicketForm(
                        provider: busProvider,
                        fromCity: fromCity ,
                        toCity: toCity,
                        amount: amount,
                      );
                    }));
                  },
                  child: Center(
                    child: Text(
                      'Book',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat'),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
