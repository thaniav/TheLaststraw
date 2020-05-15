import 'package:flutter/material.dart';
class Changepw extends StatefulWidget {
  @override
  _ChangepwState createState() => _ChangepwState();
}

class _ChangepwState extends State<Changepw> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[600],
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'CHANGE PASSWORD',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'sans-serif-light',
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left:50.0,right: 50.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
                validator: (val) => val.length<6? 'Enter a password 6+ chars long': null,
                decoration: InputDecoration(

                  hintText: 'old Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    color:Colors.grey,
                  ),
                ),
                obscureText: true,
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFormField(
              validator: (val) => val.length<6? 'Enter a password 6+ chars long': null,
              decoration: InputDecoration(

                hintText: 'new Password',
                labelStyle: TextStyle(
                  fontFamily: 'Montserrat',
                  color:Colors.grey,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(
              height: 50.0,
            ),
            RaisedButton(
              color: Colors.lightGreen,
              child: Text('Confirm',style:TextStyle(fontWeight:FontWeight.bold),

              ),
              onPressed: (){
              },
            ),
          ],
        ),
      ),
    );
  }
}
