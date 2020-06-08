

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:palet/Pages/profile/profile.dart';
import 'package:palet/Pages/Wallet/wallet.dart';
import 'package:palet/models/uid.dart';

import 'package:palet/models/user.dart';

class DatabaseService{

  final String uid;
  DatabaseService({ this.uid });
  final CollectionReference profileCollection = Firestore.instance.collection('profiles');
  final CollectionReference accountCollection = Firestore.instance.collection('accounts');
  final CollectionReference busTicketCollection = Firestore.instance.collection('bustickets');
  final CollectionReference passbookCollection = Firestore.instance.collection('passbook');




  Future updateUserData(String name, String emailID, String phone, String address, Timestamp dob) async {
  return await profileCollection.document(uid).setData({
    'name': name,
    'emailID': emailID,
    'phone': phone,
    'address': address,
    'dob': dob,


  });
}

  Future updateBusTicketsData(String provider, String passenger, Timestamp dateOfTravel, String age, String tickets, String fromCity, String toCity ) async {
    return await busTicketCollection.document(current_user_uid).collection('tickets').document().setData({
      'provider': provider,
      'passenger': passenger,
      'dateOfTravel': dateOfTravel,
      'age': age,
      'tickets': tickets,
      'fromCity': fromCity,
      'toCity': toCity,


    });
  }
  Future updatePassbook(String type, double amount, Timestamp time) async {
    return await passbookCollection.document(current_user_uid).collection('transactions').document().setData({
      'type': type,
      'amount': amount,
      'time': time,

    });
  }


Future updateUserBalance(double balance) async {
  return await accountCollection.document(uid).setData(
    {

      'balance': balance,
    }
  );
}

  Future updateUserCards(String suid) async {
    accountCollection.document(uid).collection('cards').document(suid).setData({
      'user_id':suid,
    });

  }
  Future deleteUserCards(String suid) async {
    accountCollection.document(uid).collection('cards').document(suid).delete();

  }

  Future updateProfile(String i) async {
    return await profileCollection.document(uid).updateData(
        {
          'image':i
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
      dob: doc.data['dob'] ?? '',


    );
  }).toList();
  }







  List<CardData> _cardsListFromSnapshot(QuerySnapshot snapshot){
   return snapshot.documents.map((doc){
     return CardData(
     exp: doc.data["cardExpiry"] ?? '',
       name: doc.data["cardHolderName"] ?? '',
     number: doc.data["cardNumber"] ?? '',
       cvv: doc.data["cvv"] ?? '',

   );
  }).toList();
}

  List<TicketData> _ticketsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return TicketData(
        provider: doc.data["provider"] ?? '',
        passenger: doc.data["passenger"] ?? '',
        dateOfTravel: doc.data["dateOfTravel"] ?? '',
        age: doc.data["cardNumber"] ?? '',
        tickets: doc.data["tickets"] ?? '',
        fromCity: doc.data["fromCity"]?? '',
        toCity: doc.data["toCity"]?? '',

      );
    }).toList();
  }

  List<TransactionData> _transactionsListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return TransactionData(
        type: doc.data["type"] ?? '',
        amount: doc.data["amount"] ?? '',
        time: doc.data["time"] ?? '',


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
    dob: snapshot.data["dob"],
    image: snapshot.data["image"],

  );
  }


WalletData _walletDataFromSnapshot(DocumentSnapshot snapshot){
  return WalletData(
    uid: uid,
    balance: snapshot.data["balance"],

  );
}

 // ADD THIS PORTION
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

  Stream<WalletData> get walletData{
    return accountCollection.document(uid).snapshots()
        .map(_walletDataFromSnapshot);
  }

  Stream<List<CardData>> get cardData{
    return accountCollection.document(uid).collection('cards').snapshots()
    .map(_cardsListFromSnapshot);

  }

  Stream<List<TicketData>> get ticketData{
    return busTicketCollection.document(uid).collection('tickets').snapshots()
        .map(_ticketsListFromSnapshot);
  }

  Stream<List<TransactionData>> get transactionData{
    return passbookCollection.document(uid).collection('transactions').snapshots()
        .map(_transactionsListFromSnapshot);
  }

}