import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:palet/Pages/profile/profile.dart';
import 'package:palet/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:palet/Pages/profile/profile.dart';
class ProfileList extends StatefulWidget {
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  @override
  Widget build(BuildContext context) {

    final profiles = Provider.of<List<Profile>>(context);
profiles.forEach((profile){
  print(profile.name);
  print(profile.emailID);
  print(profile.phone);
  print(profile.address);


    });

    return Container();
  }
}
