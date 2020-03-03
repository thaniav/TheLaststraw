import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:palet/Pages/profile/profile.dart';
class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });
  final CollectionReference profileCollection = Firestore.instance.collection('profiles');

Future updateUserData(String name, String emailID, String mobile, String address) async {
  return await profileCollection.document(uid).setData({
    'name': name,
    'emailID': emailID,
    'mobile': mobile,
    'address': address,

  });
}

//brew list from snapshot
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

//get profiles stream

Stream<List<Profile>> get profiles{
  return profileCollection.snapshots()
.map(_profileListFromSnapshot);
}

}