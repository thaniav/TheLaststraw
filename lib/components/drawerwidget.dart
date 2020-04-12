//      drawer: Drawer(
//        child: ListView(
//          children: <Widget>[
//            UserAccountsDrawerHeader(accountName: Text('Mihir'),
//              accountEmail:Text('mihir@gmail.com'),
//
//              currentAccountPicture: GestureDetector(
//                child: CircleAvatar(
//                  backgroundColor: Colors.black,
//                  child: Icon(Icons.person),
//                ),
//              ),
//              decoration: BoxDecoration(
//                  color: Colors.teal
//              ),
//            ),
//            //body
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('HomePage'),
//                leading: Icon(Icons.home),
//              ),
//            ),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('My Account'),
//                leading: Icon(Icons.person,color: Colors.black,),
//              ),
//            ),
//            InkWell(
//              onTap: (){},
//              child: ListTile(
//                title: Text('My orders'),
//                leading: Icon(Icons.shopping_basket,color: Colors.red,),
//              ),
//            ),
//            InkWell(
//              onTap: (){
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>new Cart()));
//              },
//              child: ListTile(
//                title: Text('Shopping Cart'),
//                leading: Icon(Icons.shopping_cart,color: Colors.amber,),
//              ),
//            ),
//            Divider(),
//
//
//
//
//          ],
//        ),
//      ),