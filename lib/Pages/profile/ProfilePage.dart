import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:palet/Pages/authenticate/forgotPassword.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:palet/Pages/profile/profile.dart';
import 'package:palet/shared/loading.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/models/user.dart';
import 'package:palet/services/auth.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:palet/Pages/profile/kyc.dart';

class ProfilePage extends StatefulWidget {
  final AuthService _auth = AuthService();

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String name;
  String emailID;
  String phone;
  String address;
  String password;
  int day;
  int month;
  int year;
  int d;
  int m;
  int y;
  DateTime newDt = DateTime.now();
  Timestamp myTimeStamp = Timestamp.fromDate(DateTime.now());
  Timestamp dob;
  Timestamp newdob;

  static DateTime birthDate = DateTime.now();
  bool isDateSelected=false;

  String birthDateInString =
      "${birthDate.month}/${birthDate.day}/${birthDate.year}";



  bool _status = true;
  bool _newdt = false;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
      var _onpressed;
      getStatus() {
        if (!_status) {
          _onpressed = () async {
            newDt =
                await showRoundedDatePicker(
              context: context,
              initialDate: DateTime(
                  DateTime.now().year - 18),
              firstDate: DateTime(
                  DateTime.now().year - 50),
              lastDate: DateTime(
                  DateTime.now().year - 10),
              borderRadius: 16,
            );
            print('$newDt is newdt');
            setState(() {
              _newdt = true;
              isDateSelected=true;
              day = newDt.day;
              print('$day is new day');

              month = newDt.month;
              year = newDt.year;
              newdob = Timestamp.fromDate(newDt);
              print(newdob.toDate());
            });
          };
        }
        return _onpressed;
      }

  //    final profiles = Provider.of<List<Profile>>(context);
      final user = Provider.of<UserID>(context);

      return StreamBuilder<UserData>(
          stream: DatabaseService(uid: user.uid).userData,
          builder: (context, snapshot) {
            UserData userData = snapshot.data;



            if (snapshot.hasData) {
              dob = userData.dob;
              newDt = dob.toDate();
              m = newDt.month;
              d = newDt.day;
              y = newDt.year;

              return Theme(
                data: ThemeData(
                  textTheme: TextTheme(
                    body1: TextStyle(
                      color: Colors.black
                    )
                  )
                ),
                child: Scaffold(


                  backgroundColor: kMainColor,
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: kPinkColor,
                    child: Text('KYC'),
                    onPressed: (){
Navigator.pushNamed(context, '/kyc');
                    },

                  ),
                    appBar: AppBar(
                      elevation: 0.0,
                      backgroundColor: kMainColor,
                      title: Row(
                        children: <Widget>[
                          Text(
                            'Profile',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                              fontFamily: 'sans-serif-light',
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    body: new Container(


                      child: Form(
                        key: _formKey,
                        child: new ListView(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                new Container(
                                  height: 210.0,

                                  child: new Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(top: 1.0),
                                        child: new Stack(
                                            fit: StackFit.loose,
                                            children: <Widget>[
                                              new Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[

                                                  Padding(
                                                    padding: const EdgeInsets.all(30.0),
                                                    child: new Container(
                                                        width: 140.0,
                                                        height: 140.0,
                                                        decoration: new BoxDecoration(

                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                            image: userData.image != null
                                                                ? (new NetworkImage(
                                                                userData.image))
                                                                : new AssetImage('Asset/bus1.png'),
                                                            fit: BoxFit.cover,
                                                          ),
                                                        )),
                                                  ),

  //                                        Container(
  //                                          child: FlatButton(
  //                                            onPressed: getImage,
  //                                          ),
  //
  //                                        ),
  //                                        Container(
  //                                          child: sampleimage == null ? Text('select image') : enableUpload(),
  //
  //                                        ),
                                                ],
                                              ),

                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                                new Container(

                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: 25.0),
                                    child: new Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 25.0),
                                            child: new Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Personal Information',
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    _status
                                                        ? _getEditIcon()
                                                        : new Container(),
                                                  ],
                                                )
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Name',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Flexible(
                                                  child: new TextFormField(
                                                    textCapitalization: TextCapitalization.sentences,
                                                    initialValue:
                                                        userData.name ?? null,
                                                    decoration:
                                                        const InputDecoration(
                                                          filled: true,
                                                          fillColor: Colors.white30,
                                                      hintText: "Enter Your Name",
                                                    ),
                                                    onChanged: (val) {
                                                      setState(() => name = val);
                                                    },
                                                    enabled: !_status,
                                                    autofocus: !_status,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Email ID',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Flexible(
                                                  child: new TextFormField(
                                                    readOnly: true,
                                                    initialValue:
                                                        userData.emailID,
                                                    decoration:
                                                         InputDecoration(

                                                          filled: true,

                                                          fillColor: Colors.white30,
                                                            hintText:
                                                                "Enter Email ID"),


                                                    enabled: !_status,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'DOB',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 25.0, right: 25.0),
                                          child: Row(
                                            children: <Widget>[
                                              Container(
                                                width: 220.0,
                                                child: TextFormField(
                                                  readOnly: true,
                                                  enabled: true,
                                                  decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white30,
                                                      hintText: !_newdt
                                                          ? 'DOB: $d/$m/$y'
                                                          : 'DOB: $day/$month/$year'),
                                                ),
                                              ),
                                              FlatButton(
                                                onPressed: getStatus(),
                                                child: Icon(
                                                  Icons.date_range,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 25.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Mobile',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Flexible(
                                                  child: new TextFormField(
                                                    maxLength: 10,
                                                    keyboardType: TextInputType.phone,

                                                    validator: (val) => val.length <
                                                            10
                                                        ? 'Enter a valid mobile number'
                                                        : null,
                                                    initialValue:
                                                        userData.phone ?? null,
                                                    decoration: const InputDecoration(
                                                        filled: true,
                                                        fillColor: Colors.white30,
                                                        hintText:
                                                            "Enter Mobile Number"),
                                                    onChanged: (val) {
                                                      setState(() => phone = val);
                                                    },
                                                    enabled: !_status,
                                                  ),
                                                ),
                                              ],
                                            )),

                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0,),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: <Widget>[
                                                    new Text(
                                                      'Address',
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 25.0, right: 25.0, top: 2.0),
                                            child: new Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: <Widget>[
                                                new Flexible(
                                                  child: new TextFormField(
                                                    validator: (val) => val.isEmpty
                                                        ? 'Enter an address'
                                                        : null,
                                                    initialValue:
                                                        userData.address ?? null,
                                                    decoration:
                                                        const InputDecoration(
                                                            filled: true,
                                                            fillColor: Colors.white30,
                                                            hintText:
                                                                "Enter Address"),
                                                    onChanged: (val) {
                                                      setState(() => address = val);
                                                    },
                                                    enabled: !_status,
                                                  ),
                                                ),
                                              ],
                                            )),
                                        SizedBox(
                                          height: 25.0,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[

                                            RaisedButton(
                                              color: kSecondaryColor,
                                              child: Text('Change Password',style:TextStyle(fontWeight:FontWeight.bold, color: Colors.white),

                                              ),
                                              onPressed: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context){
                                                  return ForgotPass(email: userData.emailID.trim(),);
                                                }));
                                              },
                                            ),
                                          ],
                                        ),
                                        !_status
                                            ? _getActionButtons()
                                            : new Container(),


                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                      ),
                    )),
              );
            } else {
              return Loading();
            }
          });
    }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    final user = Provider.of<UserID>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
              child: new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Container(
                          child: new RaisedButton(
                        child: new Text("Save"),
                        textColor: Colors.white,
                        color: kSecondaryColor,
                        onPressed: () async {
                          FirebaseUser user =
                              await FirebaseAuth.instance.currentUser();
                          if (_formKey.currentState.validate()) {



                            setState(() {
                              _status = true;
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            });
                            print(dob.toDate());

                            await DatabaseService(uid: user.uid).updateUserData(
                              name ?? userData.name,
                              emailID ?? userData.emailID,
                              phone ?? userData.phone,
                              address ?? userData.address,
                              newdob ?? userData.dob,

                            );
                            await DatabaseService(uid: current_user_uid).updateProfile(uploadedFileURL);


                          }
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                      )),
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Container(
                          child: new RaisedButton(
                        child: new Text("Cancel"),
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            _status = true;
                            FocusScope.of(context)
                                .requestFocus(new FocusNode());
                          });
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                      )),
                    ),
                    flex: 2,
                  ),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }

  Widget _getActionButton() {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Container(
              child: new RaisedButton(onPressed: () {
                setState(() {
                  _status = true;
                });
              }),
            ),
          )
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: current_user_uid).userData,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;
          if (snapshot.hasData){
            return new GestureDetector(
              child: new CircleAvatar(
                backgroundColor: kSecondaryColor,
                radius: 14.0,
                child: new Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
              onTap: () {
                setState(() {
                  if (userData.image != null) {
                    _status = false;

                  }
                  else{
                    Scaffold.of(context).showSnackBar(SnackBar(
                        backgroundColor: kPinkColor,
                        content:Text('Upload picture to edit')));
                  }
                });
              },
            );
          }
          else{
            return Loading();
          }
        }
    );


  }


}
