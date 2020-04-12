import 'package:flutter/material.dart';
import 'package:palet/Pages/Add_card.dart';
import 'package:palet/components/mode.dart';



class Payment extends StatefulWidget {
  final String text;
  Payment({Key key, @required this.text}) : super(key: key);
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes:<String,WidgetBuilder>{
          '/add_card':(BuildContext context) => new addcard(),
        },
        home:Radiowidget(),
        theme:ThemeData(
          primaryColor: Color(0xFFf1c40f),
        )
    );
  }
}


class Radiowidget extends StatefulWidget {
  Radiowidget():super();
  final String title='payment methods';
  @override
  _RadiowidgetState createState() => _RadiowidgetState();
}

class _RadiowidgetState extends State<Radiowidget> {
  List<User> users;
  User selectedUser;
  int selectedRadio;
  int selectedRadioTile=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedRadio=0;
    selectedRadioTile=0;
    User.getUsers();
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
  setSelectedUser(User user){

    setState(() {
      selectedUser=user;
    });

  }
  List<Widget>createRadioListUsers(){
    List<Widget> widget =[];

    for(User user in users)
    {
      widget.add(
        RadioListTile(
          value:user,
          groupValue:selectedUser,
          title:Text(user.cardNumber),
          onChanged:(currentUser){
            print("Current user ${user.cardNumber}");
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
        title: Text("Payment methods"),
        backgroundColor: Colors.teal[600],
      ),

      body:Column(
        mainAxisAlignment:MainAxisAlignment.start,
        children: <Widget>[
          Column(
            children:createRadioListUsers(),

          ),
          SizedBox(height:200.0),
          Container(
            padding: EdgeInsets.all(15.0),
            child: new RaisedButton(onPressed: (){

            },
              color:Colors.green,

              child:new Text('pay '),),
          )
        ],

      ),

      floatingActionButton: FloatingActionButton(
        onPressed:(){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>addcard()));
        },
        child:Icon(Icons.credit_card),
      ),


    );
  }
}

