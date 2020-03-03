

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:palet/Pages/profile/profile.dart';
import 'package:palet/components/mode.dart';
import 'package:palet/models/user.dart';
import 'package:palet/models/user.dart';
class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });
  final CollectionReference profileCollection = Firestore.instance.collection('profiles');

Future updateUserData(String name, String emailID, String phone, String address) async {
  return await profileCollection.document(uid).setData({
    'name': name,
    'emailID': emailID,
    'phone': phone,
    'address': address,

  });
}

//profile list from snapshot
  List<Profile> _profileListFromSnapshot(QuerySnapshot snapshot){
  return snapshot.documents.map((doc){
    return Profile(
      name: doc.data['name'] ?? '',
      emailID: doc.data['emailID'] ?? '',
      phone: doc.data['phone'] ?? '',
      address: doc.data['address'] ?? '',
    );
  }).toList();
  }

  //userData from snapshot

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
  return UserData(
    uid: uid,
    name: snapshot.data["name"],
    emailID: snapshot.data["emailID"],
    phone: snapshot.data["phone"],
    address: snapshot.data["address"],
  );
  }


//get profiles stream

Stream<List<Profile>> get profiles{
  return profileCollection.snapshots()
.map(_profileListFromSnapshot);
}

//get user doc stream
Stream<UserData> get userData{
  return profileCollection.document(uid).snapshots()
      .map(_userDataFromSnapshot);
}


}