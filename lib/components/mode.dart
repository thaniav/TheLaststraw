class User {
  String cardname;
  int accountno;

  User({this.cardname, this.accountno});

  static List<User> getUsers() {
    return <User>[
      User(cardname: 'ICICI card card', accountno: 123456789),
      User(cardname: 'AXIS debit card', accountno: 1112344556),
      User(cardname: 'daoap debit card', accountno: 1112344556),
    ];
  }
}
