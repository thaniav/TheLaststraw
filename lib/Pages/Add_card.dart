import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home:addcard(),
));

class addcard extends StatefulWidget {
  @override
  _addcardState createState() => _addcardState();
}

class _addcardState extends State<addcard> {
  bool _value1=false;
  void _value1Changed(bool value) => setState(() =>  _value1 = value);
  bool _value2=false;
  void _value2Changed(bool value) => setState(() =>  _value2 = value);
  @override
  Widget build(BuildContext context) {
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
              Container(
                padding:EdgeInsets.only(top:0.0,left:20.0,right:20.0),
                child:Column(
                  children: <Widget>[
                    TextField(
                      decoration:InputDecoration(
                        labelText:'Card number',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green),
                        ),
                      ),
                    ),
                    TextField(
                      decoration:InputDecoration(
                        labelText:'expiry',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green),
                        ),
                      ),
                    ),
                    TextField(
                      decoration:InputDecoration(
                        labelText:'cvv',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green,),
                        ),
                      ),
                      obscureText:true,
                    ),
                    TextField(
                      decoration:InputDecoration(
                        labelText:'Card Holders name',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green,),
                        ),
                      ),
                      obscureText:true,
                    ),
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
                      child: new RaisedButton(onPressed: (){},
                        color:Colors.green,

                        child:new Text('pay '),),
                    )

                  ],
                ),
              ),

            ],
          ),

          ExpansionTile(
            trailing: Icon(Icons.credit_card),
            title:Text('Credit card',
              style:TextStyle(
                color:Colors.black,
                fontWeight: FontWeight.w500,
              ),),
            children: <Widget>[
              Container(
                padding:EdgeInsets.only(top:0.0,left:20.0,right:20.0),
                child:Column(
                  children: <Widget>[
                    TextField(
                      decoration:InputDecoration(
                        labelText:'Card number',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green),
                        ),
                      ),
                    ),
                    TextField(
                      decoration:InputDecoration(
                        labelText:'expiry',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green),
                        ),
                      ),
                    ),
                    TextField(
                      decoration:InputDecoration(
                        labelText:'cvv',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green,),
                        ),
                      ),
                      obscureText:true,
                    ),
                    TextField(
                      decoration:InputDecoration(
                        labelText:'Card Holders name',
                        labelStyle: TextStyle(
                          fontSize:11.0,
                          fontFamily: 'Montserrat',
                          color:Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color:Colors.green,),
                        ),
                      ),
                      obscureText:true,
                    ),
                    Container(
                      child:CheckboxListTile(
                        value:_value2,
                        onChanged:_value2Changed,
                        title:new Text('Remember card'),
                        controlAffinity:ListTileControlAffinity.leading,
                      ),
                    ),
                    Container(
                      child: new RaisedButton(onPressed: (){},
                        color:Colors.green,
                        child:new Text('pay '),),
                    )

                  ],
                ),
              ),
            ],

          ),
        ],
      ),
    );
  }
}