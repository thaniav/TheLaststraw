import 'package:flutter/material.dart';

import 'Mobileplans.dart';

class Mobile_Recharge extends StatefulWidget {
  Mobile_Recharge():super();
  final String title='payment methods';
  @override
  _Mobile_RechargeState createState() => _Mobile_RechargeState();
}

class _Mobile_RechargeState extends State<Mobile_Recharge> {
  List<Plans>users;
  Plans selectedUser;
  int selectedRadio;
  int selectedRadioTile=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio=0;
    selectedRadioTile=0;
    users=Plans.getUsers();
  }
  DataTable dataBody()
  {
    return DataTable(
      columns: [
        DataColumn(
            label:Text("Plan(Rs)"),
            numeric:false,
            tooltip: "this is plan"
        ),
        DataColumn(
            label:Text("Validity"),
            numeric:false,
            tooltip: "this is validity"
        ),
        DataColumn(
            label:Text("benifits"),
            numeric:false,
            tooltip: "this is benifits"
        ),

      ],
      rows:[],
    );
  }
  setSelectedRadio(int val)
  {
    setState(() {
      selectedRadio=val;
    });
  }
  setSelectedRadioTile(int val)
  {
    setState(() {
      selectedRadioTile=val;
    });
  }
  setSelectedUser(Plans user){

    setState(() {
      selectedUser=user;
    });

  }
  List<Widget>createRadioListUsers(){
    List<Widget> widget =[];
    for(Plans user in users)
    {
      widget.add(
        RadioListTile(
          value:user,
          groupValue:selectedUser,
          title:Text(user.plan),
          onChanged:(currentUser){
            print("Current user ${user.plan}");
            setSelectedUser(currentUser);
            ExpansionTile(
              title:Text('hey you!'),
            );
          },
          selected:selectedUser == user,
        ),
      );
    }
    return widget;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children: <Widget>[
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              verticalDirection:VerticalDirection.down,
              children: <Widget>[
                Center(
                  child:dataBody(),
                ),]),
          Column(
            children:createRadioListUsers(),
          ),

          SizedBox(height:200.0),
          Container(
            padding: EdgeInsets.all(15.0),
            child: new RaisedButton(onPressed: (){},
              color:Colors.green,

              child:new Text('pay '),),
          )
        ],

      ),
    );
  }
}
