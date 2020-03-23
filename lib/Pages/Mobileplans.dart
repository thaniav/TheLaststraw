class Plans{
  String plan;
  Plans({this.plan});

  static List<Plans> getUsers(){
    return <Plans>[
      Plans(plan:"2121               366 days                125GB "),
      Plans(plan:"555                 84 days                   35GB"),
      Plans(plan:"399                 56 days                   25GB"),
      Plans(plan:"28                   28 days                   10GB"),
    ];
  }


}
