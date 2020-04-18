import 'package:flutter/material.dart';
import 'package:palet/constants.dart';

class BusTicketForm extends StatelessWidget {
  static String id='/busform';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
      ),
      body: Padding(
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

            ),
            DropdownButtonFormField(

            )


          ],
        ),
      )

    );
  }
}
