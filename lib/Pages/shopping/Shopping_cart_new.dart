import 'package:flutter/material.dart';
import 'package:palet/Pages/Wallet/PaymentOptions.dart';
import 'package:palet/Pages/shopping/Shopping_list_new_Mobile.dart';
import 'package:palet/Pages/shopping/New_products.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/Pages/shopping/Shopping_list_new.dart';


Shopping_list obj = new Shopping_list();
int s=0;
List<ProductModel> cart = obj.cart_send();
//Shopping_list_Mobile obj1=new Shopping_list_Mobile();
//List<ProductModel> cart1=obj1.cart_send();
//List<ProductModel> cart=cart1+cart2;


class Newcart extends StatefulWidget {
  static String id='/shopcart';
  cart_clear()
  {
    cart.clear();

  }
  cart_add(ProductModel fromProductDetail)
  {
    cart.add(fromProductDetail);
    s=s+fromProductDetail.price*fromProductDetail.quantity;

  }





  @override
  _NewcartState createState() => _NewcartState();
}

class _NewcartState extends State<Newcart> {




  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kMainColor,
          centerTitle: true,
          title: Text('Cart'),
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            return Card(
              color: kMainColor,
              child: ListTile(
                leading: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          if (cart[index].quantity == 0) {
                            cart[index].quantity = 0;
                          } else {
                            cart[index].quantity--;
                            s = s - cart[index].price;
                          }
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          cart[index].quantity++;
                          s = s + cart[index].price;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          s = s - (cart[index].quantity * cart[index].price);
                          cart[index].quantity = 0;
                          cart.removeAt(index);
                        });
                      },
                    ),
                  ],
                ),
                title: Text(
                  cart[index].name,
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "Rs${cart[index].price}",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${cart[index].quantity}",
                  style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text("Total"),
                  subtitle: Text("\$$s"),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return PaymentOptions(amount: s.toDouble(),);
                    }));
                  },
                  child: Text(
                    "Check Out",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: kMainColor,
                ),
              ),
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      s=0;
                      for(int i=0;i<cart.length;i++)
                        {
                          cart[i].quantity=0;
                        }
                      cart.clear();

                    });
                  },
                  child: Text(
                    "Clear",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


