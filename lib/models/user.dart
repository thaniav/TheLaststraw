
class UserID{
  final String uid;
  UserID(this.uid);
}

class UserData{
  final String uid;
  final String name;
  final String emailID;
  final String phone;
  final String address;


  UserData({ this.uid, this.name, this.emailID, this.phone, this.address });


}


class WalletData{
  final String uid;
  final int balance;

  WalletData({ this.uid, this.balance });

}

class CardData{
  final String uid;
  final String exp;
  final String name;
  final String number;

  CardData({ this.uid, this.exp, this.name, this.number });

}






