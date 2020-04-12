import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/Shopping_list.dart';
import 'package:palet/Pages/shopping/Checkout.dart';
import 'package:palet/components/New_products.dart';
class Shoppingcart extends StatefulWidget {
  @override
  _ShoppingcartState createState() => _ShoppingcartState();
}

class _ShoppingcartState extends State<Shoppingcart> {
  List<ProductModel> cart=[];
  int sum=0;
  int Qty=0;
  void changedata(){
    setState(() {
      Qty=Qty+1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:
        AppBar(
          elevation: 0.0,
          backgroundColor: Colors.teal,
          centerTitle: true,
          title: Text('ShoppApp'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Products",

              ),
              Tab(
                text: "Cart Items",
              ),

            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ShoppingList((selected_product){
              selected_product.quantity=selected_product.quantity+1;
              setState(() {
               cart.add(selected_product);

               cart.forEach((item){
                 sum=sum+(item.price);

               });
              });
            }),
            Checkout(cart: cart,sum: sum,),

          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text("Total"),
                  subtitle: Text("\$$sum"),

                ),
              ),
              Expanded(
                  child: MaterialButton(onPressed: (){},
                    child: Text("Check Out",style: TextStyle(
                        color: Colors.white
                    ),),
                    color: Colors.teal,
                  )

              )
            ],
          ),
        ),

      ),
    );
  }
}
