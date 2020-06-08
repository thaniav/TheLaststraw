import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ticket_widget/flutter_ticket_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:palet/Pages/BusBooking/BusTicketsBLABLA.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/database.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/shared/loading.dart';

class TicketsList extends StatefulWidget {
  static String id='/tickets';
  @override
  _TicketsListState createState() => _TicketsListState();
}

class _TicketsListState extends State<TicketsList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<TicketData>>(
      stream: DatabaseService(uid: current_user_uid).ticketData,
      builder: (context, snapshot) {

        if(snapshot.hasData) {
          List<TicketData> ticketData = snapshot.data;
          List<BookedTicket> cardNumbers = [];
          for (var ticket in ticketData) {
            final cardWidget = BookedTicket(
            noOfTickets: ticket.tickets,
            fromCity: ticket.fromCity,
              toCity: ticket.toCity,
              dateOfTravel: ticket.dateOfTravel,
              provider: ticket.provider,
              ticketNumber: 'L1',
            );
            cardNumbers.add(cardWidget);
          }
          return Theme(
            data: ThemeData(
              textTheme: TextTheme(
                body1: TextStyle(
                  fontFamily: 'PatuaOne',
                  fontSize: 15,
                  color: Colors.white
                )
              ),
              cardColor: Colors.lightBlue

            ),
            child: Scaffold(
              body: ListView(
                children: cardNumbers
              ),
            ),
          );

        }else
          {
            return Loading();
          }
      }
    );
  }
}

class BookedTicket extends StatelessWidget {
 final String provider;
 final String fromCity;
 final String toCity;
 final Timestamp dateOfTravel;
 final String ticketNumber;
 final String noOfTickets;
 DateTime newDt;
int month;
int day;
int year;

 BookedTicket({ this.provider, this.fromCity, this.toCity, this.dateOfTravel, this.ticketNumber, this.noOfTickets,}) ;

  @override

  Widget build(BuildContext context) {
   newDt=dateOfTravel.toDate();
   month=newDt.month;
   day=newDt.day;
   year=newDt.year;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(

        elevation: 1.0,
child: Padding(
  padding: const EdgeInsets.all(16.0),
  child:   Container(

    height: 165.0,

    width: 300.0,

    child:  Container(

      child: Row(
        children: <Widget>[

            Column(
mainAxisAlignment: MainAxisAlignment.spaceAround,


              children: <Widget>[


  Icon(FontAwesomeIcons.bus, size: 50.0,color: kSecondaryColor,),



              ],

            ),
            SizedBox(width: 10.0,),

            Column(
            crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[

                Row(

      children: <Widget>[

        Text(fromCity),
        SizedBox(width: 20.0,),
        Icon(Icons.arrow_forward),
        SizedBox(width: 20.0,),
        Text(toCity),

      ],

                ),
                SizedBox(height: 10.0,),

                Container(height: 0.5, width: 200.0, color: Colors.white30,),
                SizedBox(height: 10.0,),

Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: <Widget>[
    Row(

      children: <Widget>[

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Seat(s)'),
        ),
      ],
    ),

    Text(ticketNumber),
    SizedBox(height: 20.0,),

    Text(provider),
    SizedBox(height: 5.0,),

    Text('$day/$month/$year',
      style: TextStyle(
          color: Colors.white30,
          fontFamily: 'SourceSansPro'
      ),),
  ],),



              ],

            ),

        ],

      )







    ),

  ),
),
      ),
    );
  }
}
