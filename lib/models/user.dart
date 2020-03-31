
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
  final String walletID;
  final int balance;

  WalletData({ this.uid, this.walletID, this.balance });

}

class CardData{
  final String exp;
  final String name;
  final String number;

  CardData({this.exp, this.name, this.number});

}
