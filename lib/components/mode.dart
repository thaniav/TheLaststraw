class User {
  String cardname;
  int accountno;
  int balance;

  User({this.cardname, this.accountno, this.balance });

  static List<User> getUsers() {
    return <User>[
      User(cardname: 'ICICI card card', accountno: 123456789, balance: 1000),
      User(cardname: 'AXIS debit card', accountno: 1112344556, balance: 1000),
      User(cardname: 'daoap debit card', accountno: 1112344556, balance: 1000),
    ];
  }
}
