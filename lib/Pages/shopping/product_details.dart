import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/New_products.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';
import 'package:palet/Pages/shopping/Shopping_search.dart';
Newcart obj=new Newcart();
class ProductDetails extends StatefulWidget {
  
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;
  final product_detail_detail;

  ProductDetails({
   this.product_detail_name,
    this.product_detail_new_price,
    this.product_detail_old_price,
    this.product_detail_picture,
    this.product_detail_detail,

});


  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  String alertBoxText1="Color";
  String alertBoxText3="Qty";

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kMainColor,
          centerTitle: true,
          title: Text('ShoppApp'),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            },),
            //IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: (){},)

          ],

        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 300.0,
              child: GridTile(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_detail_picture),
                ),
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(widget.product_detail_name,style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16.0
                    ),),
                    title: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text("Rs${widget.product_detail_old_price}",style: TextStyle(
                            color: Colors.grey,decoration: TextDecoration.lineThrough
                          ),),

                        ),
                        Expanded(
                          child: Text("Rs${widget.product_detail_new_price}",style: TextStyle(
                            color: Colors.red,fontWeight: FontWeight.bold
                          ),),

                        ),
                      ],
                    ),
                  ),
                ),

              ),
            ),
            //============FIRST BUTTON=========
            Row(
              children: <Widget>[
                //========SIZE BUTTON========
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context,builder:(context){
                        return new AlertDialog(
                          title: Text("Colour"),
                          content: Text("choose the color"),
                          actions: <Widget>[
                        DropdownButton<String>(
                        value: alertBoxText1,
                          icon: Icon(Icons.arrow_downward),
                          iconSize: 24,
                          elevation: 16,
                          style: TextStyle(color: Colors.teal),

                          onChanged: (String newValue) {
                            setState(() {
                              alertBoxText1 = newValue;
                              Navigator.of(context).pop(context);
                            });
                          },
                          items: <String>['Color', 'Red', 'Black', 'White']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),

                          ],

                        );
                      });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(alertBoxText1,style: TextStyle(
                              color: Colors.black
                          ),),
                        ),

                        Expanded(
                          child:Icon(Icons.arrow_drop_down),
                        ),

                      ],
                    ),
                  ),
                ),
                //=========COLOR BUTTON======
//              Expanded(
//                child: MaterialButton(
//                  onPressed: (){
//
// showDialog(context: context,builder: (context){
////                      return AlertDialog(
////                        title: Text(alertBoxText2),
////                        content: Text("choose color"),
////                        actions: <Widget>[
////                          FlatButton(onPressed: (){
////                            setState(() {
////                              alertBoxText2="Red";
////                              print(alertBoxText2);
////                            });
//                          },
//                            child: Text("Red",style: TextStyle(
//                                color: Colors.redAccent
//                            ),
//                            ),
//                          ),
//                          MaterialButton(onPressed: (){
//                            setState(() {
//                              alertBoxText2="Black";
//                            });
//
//                          },
//                            child: Text("Black",style: TextStyle(
//                                color: Colors.black54
//                            ),),),
//                          MaterialButton(onPressed: (){
//                            setState(() {
//                              alertBoxText2="White";
//                            });
//
//                          },
//                            child: Text("White",style: TextStyle(
//                                color: Colors.blueGrey
//                            ),),),
//
//                          MaterialButton(onPressed: (){
//                            Navigator.of(context).pop(context);
//                            print(alertBoxText2);
//                          },
//                          child: Text("Close",style: TextStyle(
//                              color: Colors.teal
//                          ),),)
//                        ],
//                      );
//                    });
//                  },
//                  color: Colors.white,
//                  textColor: Colors.grey,
//                  elevation: 0.2,
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: Text("Color",style: TextStyle(
//                          color: Colors.black
//                        ),
//                        ),
//                      ),
//
//                      Expanded(
//                        child:Icon(Icons.arrow_drop_down),
//                      ),
//                    ],
//                  ),
//                ),
//              ),
                //=========QUANTITY BUTTON=========
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      showDialog(context: context,builder: (context){
                        return AlertDialog(
                          title: Text("Qty"),
                          content: Text("choose"),
                          actions: <Widget>[
                            DropdownButton<String>(
                              value: alertBoxText3,
                              icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(color: Colors.teal),

                              onChanged: (String newValue) {
                                setState(() {
                                  alertBoxText3 = newValue;
                                  Navigator.of(context).pop(context);
                                });
                              },
                              items: <String>['Qty', '1', '2', '3']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      });
                    },
                    color: Colors.white,
                    textColor: Colors.grey,
                    elevation: 0.2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(alertBoxText3,style: TextStyle(
                              color: Colors.black
                          ),),
                        ),
                        Expanded(
                          child:Icon(Icons.arrow_drop_down),
                        ),
                      ],
                    ),
                  ),
                ),

              ],
            ),
            //==========THE SECOND BUTTON========
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    onPressed: (){
                      setState(() {
                        if(alertBoxText1=='Color'||alertBoxText3=='Qty')
                          {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>new  AlertDialog(
                              title: Text('Invalid Choice'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text('Please Select a valid '+alertBoxText3+' or '+alertBoxText1),
                                  ],
                                ),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('Close'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ), ));


                          }
                        obj.cart_add(ProductModel(widget.product_detail_name,widget.product_detail_new_price,int.parse(alertBoxText3),widget.product_detail_old_price,widget.product_detail_picture,widget.product_detail_detail));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>new Newcart()));
                      });


                    },
                    color: Colors.red,
                    textColor: Colors.white,
                    elevation: 0.2,
                    child: Text("Add to Cart"),

                  ),
                ),
               // IconButton(icon: Icon(Icons.add_shopping_cart,color: Colors.red,),onPressed: (){},),

               // IconButton(icon: Icon(Icons.favorite_border,color: Colors.red,),onPressed: (){},),



              ],
            ),
            Divider(),
            ListTile(
              title: Text("Product description"),
              subtitle: Text(widget.product_detail_detail),
            ),
          ],
        ),
      ),
    );
  }
}
