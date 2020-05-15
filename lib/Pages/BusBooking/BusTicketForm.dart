import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:palet/Pages/BusBooking/BusTicketsBLABLA.dart';
import 'package:palet/constants.dart';

class BusTicketForm extends StatefulWidget {
  static String id='/busform';
  final String provider;
  final String fromCity;
  final String toCity;
  final double amount;




  BusTicketForm({this.provider, @required this.fromCity, @required this.toCity, @required this.amount});

  @override
  _BusTicketFormState createState() => _BusTicketFormState();
}

class _BusTicketFormState extends State<BusTicketForm> {
  String noOfTickets='No. of Tickets';
  String age;
  String passenger;

  var tickets = [
    '1',
    '2',
    '3',
    '4',
    ];

  Timestamp dateOfTravel;

  int day = 00;

  int month = 00;

  int year = 0000;

  DateTime newDt = DateTime.now();

  Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());

  bool isDateSelected=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        title: Text(widget.provider),
        elevation: 0.0,
        backgroundColor: kMainColor,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height - 10.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
          BorderRadius.only(topLeft: Radius.circular(110.0), topRight: Radius.circular(110.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: ListView(
            children: <Widget>[
              TextFormField(
                  validator: (val) => val.isEmpty? 'Enter your name': null,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color:Colors.grey,
                    ),
                  ),
                onChanged: (val){
                    passenger=val;
                },

              ),

SizedBox(height: 10.0),
              Row(


                children: <Widget>[
                  Container(
                    width: 170.0,

                    child: TextFormField(
                      validator: (val) => !isDateSelected? 'Select Date of birth': null,
                      decoration: InputDecoration(
                          hintText: 'Date of travel: $day/$month/$year',
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                      ),
                      enabled: false,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      isDateSelected=true;
                      newDt = await showRoundedDatePicker(
                        context: context,
                        initialDate: DateTime(DateTime.now().year - 18),
                        firstDate: DateTime(DateTime
                            .now()
                            .year - 50),
                        lastDate: DateTime(DateTime
                            .now()
                            .year - 10),
                        borderRadius: 16,


                      );
                      print('$newDt is newdt');
                      myTimeStamp = Timestamp.fromDate(newDt);
                      setState(() {
                        day=newDt.day;
                        month=newDt.month;
                        year=newDt.year;
                      });
                      dateOfTravel = Timestamp.fromDate(newDt);


                    },
                    child: Icon(
                      Icons.date_range,
                    ),
                  ),
                ],

              ),
              SizedBox(height: 10.0,),

              TextFormField(
                validator: (val) => val.isEmpty? 'Age': null,
                decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    color:Colors.grey,
                  ),
                ),
                onChanged: (val){
                  age=val;
                },

              ),
              Container(
                height: 70.0,
                child: DropdownButtonFormField(
                  iconEnabledColor: Colors.black,
                  decoration: InputDecoration(

                    labelText: noOfTickets,
                    labelStyle: TextStyle(
                        color: Colors.grey),
                  ),
                  items: tickets.map((String dropDownMenuItem) {
                    return DropdownMenuItem(
                      value: dropDownMenuItem,
                      child: Text(dropDownMenuItem,
                      style: TextStyle(
                        color: Colors.black
                      ),),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      noOfTickets = val;
                    });
                  },
                ),
              ),

              SizedBox(height: 150.0,),
              RaisedButton(
                  child: Text('Book'),
                  onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return BusTicketsBLABLA(
                            noOfTickets: noOfTickets,
                            age: age,
                            passenger: passenger,
                            fromCity: widget.fromCity,
                            toCity: widget.toCity,
                            provider: widget.provider,
                            amount: widget.amount,
                            dateOfTravel: dateOfTravel,

                          );
                        }));


                  })








            ],
          ),
        ),
      )

    );
  }
}
