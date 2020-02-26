import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState(){

  }
  Widget build( BuildContext context){
    return new Scaffold(
      drawer: Drawer(


        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text('Mihir'),
              accountEmail:Text('mihir@gmail.com'),

              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person),
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.teal
              ),
            ),
            //body
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('HomePage'),
                leading: Icon(Icons.home),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person,color: Colors.black,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My orders'),
                leading: Icon(Icons.shopping_basket,color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Shopping Cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.amber,),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.grey[600],),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help,color: Colors.blue,),
              ),
            ),



          ],
        ),
      ),
      appBar: new AppBar(
        backgroundColor: Colors.teal ,
        title: Text('Home'),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            new SizedBox(height:5.0, width: 100.0),

            new Container(

              child: new Card(elevation: 10.0,
                child:
                new InkWell(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      new
                      Icon(Icons.mobile_screen_share,
                        size: 50.0,
                      ),
                      new SizedBox(height: 10.0),
                      new Text("Manage Wallet"),
                    ],
                  ),

                  onTap: (){

                  },
                ),
              ),
            ),
            new Container(
              child: new Card(elevation: 10.0,
                child:
                new InkWell(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new
                      Icon(Icons.person,
                        size: 50.0,

                      ),
                      new SizedBox(height: 10.0),
                      new Text("Profile Management"),
                    ],
                  ),





                  onTap: (){
                    Navigator.pushNamed(context, '/profile');

                  },
                ),
              ),
            ),
            new Container(
              child: new Card(elevation: 10.0,
                child:
                new InkWell(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new
                      Icon(Icons.shopping_basket,
                        size: 50.0,

                      ),
                      new SizedBox(height: 10.0),
                      new Text("Shop"),
                    ],
                  ),

                  onTap: (){
                    Navigator.pushNamed(context, '/shopping');

                  },
                ),
              ),
            ),
            new Container(
              child: new Card(elevation: 10.0,
                child:
                new InkWell(
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new
                      Icon(Icons.last_page,
                        size: 50.0,

                      ),
                      new SizedBox(height: 10.0),
                      new Text("Logout"),
                    ],
                  ),





                  onTap: (){

                  },
                ),
              ),
            ),


          ],
        ),
      ),

    );


  }
}