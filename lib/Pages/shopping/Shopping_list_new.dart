
import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';
import 'package:palet/shared/constants.dart';
import 'package:palet/Pages/shopping/New_products.dart';
import 'package:palet/Pages/shopping/Shopping_search.dart';


List<ProductModel> _cart=[];
List<ProductModel> products=[
  ProductModel("Airpods",15995,0,19995,"Asset/shoppingImages/Air pods.jpeg","""AirPods are Apple's completely wire-free headphones, which look a bit like the Apple EarPods from older devices, but without the cables. AirPods have Apple-designed tech inside like a special wireless chip called the W1 or H1 (depending on version), an accelerometer for gestures, dual optical sensors, dual beamforming microphones for Siri and phone calls, and a second accelerometer for speech detection. 
AirPods come with the AirPods Charging Case, which is used for both charging and storage purposes so the AirPods don't get lost. The Charging Case is about the size of a container of dental floss, so it's easily pocketable. A Lightning port at the bottom lets the AirPods and the case be charged with the Lightning cables you already have on hand, and the Wireless Charging Case lets you charge with a Qi wireless charger. """),
  ProductModel("Rockerz Boat",1995,0,3000,"Asset/shoppingImages/Boat Rockerz.jpeg","""boAt Rockerz 255, while being lightweight in design pumps out your favorite tunes with powerful HD sound and deep boosted bass. The 10mm drivers installed to ensure that you get an exceptional sound experience with articulate audio reproduction with a blend of pitch-perfect frequency response. The sound produced by the boAt Rockerz 255 ensures that you differentiate music from noise and hear your favorite artists the way they were meant to be heard! """),
  ProductModel("Mobile cover",495,0,700,"Asset/shoppingImages/Mobile cover.jpeg","""Macmerise Sublime takes great care in churning out design oriented cases made with sublimation transfer method. The graphical prints of the cases are superimposed on the hard shell polycarbonate case with high intensity print infusion technology. The Design will never come off nor will it ever fade. It offers solid grip simultaneously providing smooth touch and feel to your case. The matte finish gives a premium look to the design, adding the right amount of zing that your phone needs!!
Product Image might slightly differ from the actual product due to your monitor settings. """),

  ProductModel("Bose Headphones",19999,0,25000,"Asset/shoppingImages/Bose Headphones.jpeg","""You knew we delivered on performance. But you wanted that performance to be wireless, with reliable Bluetooth® connectivity—for every type of headphone. So we engineered headphones that give you extraordinary performance and superior comfort. With no wires and no compromises, you’re free to get lost in your music.

And you never have to reach for your device: intuitive controls let you switch seamlessly between two Bluetooth devices, change volume or tracks and take and end calls. That means you can play music, receive texts and get answers using just the headphones. With headphones engineered to deliver a better wireless experience, you can stay in the zone—whether you’re at the gym, the office or anywhere in between. """),
  ProductModel("Iphone 11",89999,0,100000,"Asset/shoppingImages/Iphone 11.jpeg","""The iPhone 11, along with the iPhone 11 Pro, uses Apple's A13 Bionic processor, which contains a third-generation neural engine. It has three internal storage options: 64 GB, 128 GB, and 256GB. It also has 4 GB of RAM. The iPhone 11 has an IP68 water and dust-resistant rating along with dirt and grime, and is water-resistant up to two meters for 30 minutes. However, the manufacturer warranty does not cover liquid damage to the phone. Also, like previous iPhones, both phones do not have a headphone jack, and come with wired EarPods with a Lightning connector. The iPhone 11 is the first smartphone with built-in ultra-wideband hardware, via its Apple U1 chip. """),
  ProductModel("Oneplus 7",49999,0,55999,"Asset/shoppingImages/Oneplus 7.jpg","""Rebuilt from the ground up using 7 nm technology, the new Qualcomm® Snapdragon 855™ mobile platform raises the bar for mobile power. Enjoy better gaming, sharper photos and amazing battery life. With the OnePlus 7, everything is effortless.
The OnePlus 7 intelligently adapts to your individual use with RAM Boost. The apps you use most are preloaded in the background, and are given an extra boost of RAM to speed up start-up times and make sure they are always ready for you.Store up to 256 GB of data on your OnePlus 7 and quickly move files around with new UFS 3.0 technology. Whether you’re transferring a movie to your phone, or sending holiday photos to your laptop, transferring files is quick and easy, while even the most demanding of power users don’t have to worry about running out of space.
 """),
  ProductModel("Redmi Note7",12999,0,15999,"Asset/shoppingImages/Redmi Note 7.jpeg","""The Redmi Note 7 features a 2.2 GHz Qualcomm Snapdragon 660 AIE octa-core processor and 4 GB of RAM which pave the way for seamless gaming or multitasking. It also comes with 64 GB of storage capacity which allows for easy storing of your media files.The Redmi Note 7 features a 2.2 GHz Qualcomm Snapdragon 660 AIE octa-core processor and 4 GB of RAM which pave the way for seamless gaming or multitasking. It also comes with 64 GB of storage capacity which allows for easy storing of your media files. """),
  ProductModel("Samsung galaxyS20",74999,0,75999,"Asset/shoppingImages/Samsung galaxyS20.jpeg","""Samsung Galaxy S20 smartphone was launched on 11th February 2020. The phone comes with a 6.20-inch touchscreen display with a resolution of 1440x3200 pixels and an aspect ratio of 20:9. Samsung Galaxy S20 is powered by a 2GHz octa-core Samsung Exynos 990 processor that features 2 cores clocked at 2.73GHz, 2 cores clocked at 2.5GHz and 4 cores clocked at 2GHz. It comes with 8GB of RAM. The Samsung Galaxy S20 runs Android 10 and is powered by a 4000mAh non-removable battery. The Samsung Galaxy S20 supports wireless charging, as well as proprietary fast charging.The Samsung Galaxy S20 runs One UI 2.0 based on Android 10 and packs 128GB of inbuilt storage that can be expanded via microSD card (up to 1000GB). The Samsung Galaxy S20 is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. The Samsung Galaxy S20 measures 151.70 x 69.10 x 7.90mm (height x width x thickness) and weighs 163.00 grams. It was launched in Cloud Blue, Cloud Pink, Cosmic Grey, and colours. It features an IP68 rating for dust and water protection. It bears a glass body. """),

];
class Shopping_list extends StatefulWidget {


  List<ProductModel> cart_send()
  {
    return _cart;
  }
  List<String> products_send(){
    List<String> prod=[];
    for(int i=0;i<products.length;i++ )
      {
        prod.add(products[i].name);
      }
    return prod;
  }
  List<ProductModel> productDetails(){
    return products;
  }


  @override
  _Shopping_listState createState() => _Shopping_listState();
}

class _Shopping_listState extends State<Shopping_list> {


  Color Listcolor=Colors.white;
  void Cart_add(ProductModel p){
    if(_cart.contains(p))
    {

    }
    else{
      _cart.add(p);
    }


  }
  int s=0;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kMainColor,
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search,color: Colors.white,),onPressed: (){
              showSearch(context: context, delegate: DataSearch());
            },),
            IconButton(icon: Icon(Icons.shopping_cart,color: Colors.white,),onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>new Newcart()));

            },)
          ],

          title: Text('Product List'),),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context,index){
            return Card(
              color: kMainColor,
              child: ListTile(
                onTap: (){

                  Cart_add(products[index]);

                },
                title: Text(products[index].name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                trailing: Text("Rs${products[index].price}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                //subtitle: Text("${products[index].quantity}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

              ),
            );

          },),



      ),
    );
  }
}

