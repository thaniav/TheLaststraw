import 'package:flutter/material.dart';
import 'package:palet/Pages/authenticate/SignupPage.dart';
import 'package:palet/services/auth.dart';






class SignInPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child:Stack(
              children: <Widget>[
                Container(
                  padding:EdgeInsets.fromLTRB(15.0, 110.0,0.0,0.0),
                  child:Text(
                      'Hello',
                      style:TextStyle(
                          fontSize:80.0,fontWeight:FontWeight.bold)
                  ),
                ),
                Container(
                  padding:EdgeInsets.fromLTRB(18.0, 175.0,0.0,0.0),
                  child:Text(
                      'There',
                      style:TextStyle(
                          fontSize:80.0,fontWeight:FontWeight.bold)
                  ),
                ),
                Container(
                  padding:EdgeInsets.fromLTRB(220.0, 175.0,0.0,0.0),
                  child:Text(
                      '.',
                      style:TextStyle(
                          fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.green)
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding:EdgeInsets.only(top:35.0,left:20.0,right:20.0),
            child:Column(
              children: <Widget>[
                TextField(
                  decoration:InputDecoration(
                    labelText:'EMAIL',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color:Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.green),
                    ),
                  ),
                ),
                SizedBox(height:20.0,),
                TextField(
                  decoration:InputDecoration(
                    labelText:'PASSWORD',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color:Colors.grey,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color:Colors.green),
                    ),
                  ),
                  obscureText:true,
                ),
                SizedBox(height:5.0),
                Container(
                  alignment:Alignment(1.0,0.0),
                  padding:EdgeInsets.only(top:15.0,left:20.0),
                  child:InkWell(
                    child:Text('Forgot Password',
                      style:TextStyle(
                        color:Colors.green,
                        fontWeight:FontWeight.bold,
                        fontFamily:'Montserrat',
                        decoration:TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(height:40.0),
                Container(
                  height:40.0,
                  child:Material(
                    borderRadius:BorderRadius.circular(20.0),
                    shadowColor:Colors.greenAccent,
                    color: Colors.green,
                    elevation:7.0,
                    child:GestureDetector(
                      onTap:() async {
                        dynamic result = await _auth.SignInAnon();
                        if(result==null){
                          print("error");
                        }
                        else{
                          // Navigator.pushNamed(context,'/home');
                        }

                      },
                      child:Center(
                        child:Text(
                          'LOGIN',
                          style:TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily:'Montserrat'
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:20.0),
              ],
            ),
          ),
          SizedBox(height:15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'New to pallet?',
                style:TextStyle(
                  fontFamily: 'Montserrat',
                ),
              ),
              SizedBox(width :5.0),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/signup');
                },
                child:Text('Register',
                  style:TextStyle(
                    color:Colors.green,
                    fontFamily:'Montserrat',
                    fontWeight:FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),),
              )
            ],
          )
        ],
      ),
    );
  }
}



