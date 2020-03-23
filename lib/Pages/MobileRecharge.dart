import 'package:flutter/material.dart';


class mobile extends StatefulWidget {
  @override
  _mobileState createState() => _mobileState();
}

class _mobileState extends State<mobile> {
  String _phoneNumber;
  String _url;
  final GlobalKey<FormState> _formKey= GlobalKey<FormState>();
  Widget _buildPhoneNumber(){
    return TextFormField(
        decoration: InputDecoration(labelText:"Phone number"),
        keyboardType: TextInputType.number,
        validator: (String value){
          int p=int.tryParse(value);
          if(p==null ||p<=999999999&&p>700000000)
          {
            return 'invalid Phone number';
          }
          return 'valid Phone number';
        },
        onSaved:(String value){
          _url =value;
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Mobile recharge"),
      ),
      body: Container(
        margin:EdgeInsets.all(24),
        child:Form(
          key:_formKey,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(0.0,0.0,0.0,0.0),
                child: Text(
                  "Enter The Phone Number",
                  style: TextStyle(
                      fontSize: 40.0, fontWeight: FontWeight.bold),
                ),

              ),
              SizedBox(height: 100,),
              _buildPhoneNumber(),
              SizedBox(height: 40,),
              Container(
                height: 40.0,
                child: Material(
                  borderRadius: BorderRadius.circular(20.0),
                  shadowColor: Colors.blueAccent,
                  color: Colors.blue,
                  elevation: 7.0,
                  child: GestureDetector(
                    onTap: () {
                      if(!_formKey.currentState.validate()){
                        return;
                      };
                      _formKey.currentState.save();
                      Navigator.of(context).pushNamed('/options');
                      print(_phoneNumber);
                    },
                    child: Center(
                      child: Text(
                        'PROCEED',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'

                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),

    );
  }
}
