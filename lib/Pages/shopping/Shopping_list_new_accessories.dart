
import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/Pages/shopping/New_products.dart';
import 'package:palet/Pages/shopping/Shopping_search.dart';
import 'package:palet/Pages/shopping/product_details.dart';


List<ProductModel> _cart=[];
List products=[
  ProductModel("Airpods",15995,0,19995,"Asset/shoppingImages/Air pods.jpeg","""AirPods are Apple's completely wire-free headphones, which look a bit like the Apple EarPods from older devices, but without the cables. AirPods have Apple-designed tech inside like a special wireless chip called the W1 or H1 (depending on version), an accelerometer for gestures, dual optical sensors, dual beamforming microphones for Siri and phone calls, and a second accelerometer for speech detection. 
AirPods come with the AirPods Charging Case, which is used for both charging and storage purposes so the AirPods don't get lost. The Charging Case is about the size of a container of dental floss, so it's easily pocketable. A Lightning port at the bottom lets the AirPods and the case be charged with the Lightning cables you already have on hand, and the Wireless Charging Case lets you charge with a Qi wireless charger. """),
  ProductModel("Rockerz Boat",1995,0,3000,"Asset/shoppingImages/Boat Rockerz.jpeg","""boAt Rockerz 255, while being lightweight in design pumps out your favorite tunes with powerful HD sound and deep boosted bass. The 10mm drivers installed to ensure that you get an exceptional sound experience with articulate audio reproduction with a blend of pitch-perfect frequency response. The sound produced by the boAt Rockerz 255 ensures that you differentiate music from noise and hear your favorite artists the way they were meant to be heard! """),
  ProductModel("Mobile cover",495,0,700,"Asset/shoppingImages/Mobile cover.jpeg","""Macmerise Sublime takes great care in churning out design oriented cases made with sublimation transfer method. The graphical prints of the cases are superimposed on the hard shell polycarbonate case with high intensity print infusion technology. The Design will never come off nor will it ever fade. It offers solid grip simultaneously providing smooth touch and feel to your case. The matte finish gives a premium look to the design, adding the right amount of zing that your phone needs!!
Product Image might slightly differ from the actual product due to your monitor settings. """),

  ProductModel("Bose Headphones",19999,0,25000,"Asset/shoppingImages/Bose Headphones.jpeg","""You knew we delivered on performance. But you wanted that performance to be wireless, with reliable Bluetooth® connectivity—for every type of headphone. So we engineered headphones that give you extraordinary performance and superior comfort. With no wires and no compromises, you’re free to get lost in your music.

And you never have to reach for your device: intuitive controls let you switch seamlessly between two Bluetooth devices, change volume or tracks and take and end calls. That means you can play music, receive texts and get answers using just the headphones. With headphones engineered to deliver a better wireless experience, you can stay in the zone—whether you’re at the gym, the office or anywhere in between. """),

];
class Shopping_list_accessories extends StatefulWidget {

  @override
  _Shopping_list_MobileState createState() => _Shopping_list_MobileState();
}

class _Shopping_list_MobileState extends State<Shopping_list_accessories> {


  Color Listcolor=Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kMainColor,
        centerTitle: true,
        actions: <Widget>[

        ],

        title: Text('Accessories'),),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context,index){
          return Card(
            color: kMainColor,
            child: ListTile(
              onTap: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>new ProductDetails(
                    product_detail_name: products[index].name,
                    product_detail_new_price: products[index].price,
                    product_detail_old_price: products[index].oldprice,
                    product_detail_picture: products[index].picture,
                    product_detail_detail: products[index].details,)));

                });
              },
              title: Text(products[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              trailing: Text("Rs${products[index].price}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              //subtitle: Text("${products[index].quantity}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

            ),
          );

        },),



    );
  }
}

