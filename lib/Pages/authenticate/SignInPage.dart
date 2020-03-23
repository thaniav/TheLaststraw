import 'package:flutter/material.dart';
import 'package:palet/Pages/authenticate/SignupPage.dart';
import 'package:palet/components/loading.dart';
import 'package:palet/services/auth.dart';






class SignInPage extends StatefulWidget {
  final Function toggleView;
  SignInPage({ this.toggleView });

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SignInPage> {
  final AuthService _auth = AuthService();
  final _formKey= GlobalKey<FormState>();
bool loading = false;

  //text field state

  String email='';
  String password='';
  String error='';


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
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
                      'Pallet',
                      style:TextStyle(
                          fontSize:80.0,fontWeight:FontWeight.bold)
                  ),
                ),
//                Container(
//                  padding:EdgeInsets.fromLTRB(18.0, 175.0,0.0,0.0),
//                  child:Text(
//                      'There',
//                      style:TextStyle(
//                          fontSize:80.0,fontWeight:FontWeight.bold)
//                  ),
//                ),


//                Container(
//                  padding:EdgeInsets.fromLTRB(220.0, 175.0,0.0,0.0),
//                  child:Text(
//                      '.',
//                      style:TextStyle(
//                          fontSize:80.0,fontWeight:FontWeight.bold,color:Colors.green)
//                  ),
//                ),
              ],
            ),
          ),
          Container(
            padding:EdgeInsets.only(top:35.0,left:20.0,right:20.0),
            child: Form(
              key: _formKey,
            child:Column(
              children: <Widget>[
                TextFormField(
                    validator: (val) => val.isEmpty? 'Enter an email': null,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      color:Colors.grey,
                    ),

                  ),

                    onChanged: (val){
                      setState(()
                      => email = val
                      );
                    }
                ),
                TextFormField(
                    validator: (val) => val.length<6? 'Enter a password 6+ chars long': null,
                    decoration: InputDecoration(

                      hintText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        color:Colors.grey,
                      ),
                    ),
                    obscureText: true,
                    onChanged: (val){
                      setState(()
                      => password = val
                      );
                    }
                ),
                SizedBox(height:20.0,),

                SizedBox(height:5.0),
//                Container(
//                  alignment:Alignment(1.0,0.0),
//                  padding:EdgeInsets.only(top:15.0,left:20.0),
//                  child:InkWell(
//                    child:Text('Forgot Password',
//                      style:TextStyle(
//                        color:Colors.green,
//                        fontWeight:FontWeight.bold,
//                        fontFamily:'Montserrat',
//                        decoration:TextDecoration.underline,
//                      ),
//                    ),
//                  ),
//
//                ),
                SizedBox(height:40.0),
                Container(
                  height:40.0,
                  child:Material(
                    borderRadius:BorderRadius.circular(20.0),
                    shadowColor:Colors.greenAccent,
                    color: Colors.green,
                    elevation:7.0,
                    child:GestureDetector(
                      // not exactly the same as video
                      onTap:() async {
                        if(_formKey.currentState.validate()){
                          setState(() => loading = true);
                          dynamic result= await _auth.signInWithEmailAndPassword(email, password);


                          if(result== null){

                            setState(() => error = 'Could not sign in with those credentials' );
loading=false;


                          }

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
          ),
          SizedBox(height:20.0),
          Center(
            child: Text(
              error,
              style: TextStyle(
                  color: Colors.red),

            ),
          ),
          SizedBox(height:20.0),
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
                  widget.toggleView();
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




