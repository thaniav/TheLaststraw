
import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/Shopping_cart_new.dart';
import 'package:palet/constants.dart';
import 'package:palet/components/New_products.dart';
import 'package:palet/Pages/shopping/Shopping_search.dart';
import 'package:palet/Pages/shopping/product_details.dart';



List<ProductModel> _cart=[];
List products=[
  ProductModel("Iphone 11",89999,0,100000,"Asset/shoppingImages/Iphone 11.jpeg","""The iPhone 11, along with the iPhone 11 Pro, uses Apple's A13 Bionic processor, which contains a third-generation neural engine. It has three internal storage options: 64 GB, 128 GB, and 256GB. It also has 4 GB of RAM. The iPhone 11 has an IP68 water and dust-resistant rating along with dirt and grime, and is water-resistant up to two meters for 30 minutes. However, the manufacturer warranty does not cover liquid damage to the phone. Also, like previous iPhones, both phones do not have a headphone jack, and come with wired EarPods with a Lightning connector. The iPhone 11 is the first smartphone with built-in ultra-wideband hardware, via its Apple U1 chip. """),
  ProductModel("Oneplus 7",49999,0,55999,"Asset/shoppingImages/Oneplus 7.jpg","""Rebuilt from the ground up using 7 nm technology, the new Qualcomm® Snapdragon 855™ mobile platform raises the bar for mobile power. Enjoy better gaming, sharper photos and amazing battery life. With the OnePlus 7, everything is effortless.
The OnePlus 7 intelligently adapts to your individual use with RAM Boost. The apps you use most are preloaded in the background, and are given an extra boost of RAM to speed up start-up times and make sure they are always ready for you.Store up to 256 GB of data on your OnePlus 7 and quickly move files around with new UFS 3.0 technology. Whether you’re transferring a movie to your phone, or sending holiday photos to your laptop, transferring files is quick and easy, while even the most demanding of power users don’t have to worry about running out of space.
 """),
  ProductModel("Redmi Note7",12999,0,15999,"Asset/shoppingImages/Redmi Note 7.jpeg","""The Redmi Note 7 features a 2.2 GHz Qualcomm Snapdragon 660 AIE octa-core processor and 4 GB of RAM which pave the way for seamless gaming or multitasking. It also comes with 64 GB of storage capacity which allows for easy storing of your media files.The Redmi Note 7 features a 2.2 GHz Qualcomm Snapdragon 660 AIE octa-core processor and 4 GB of RAM which pave the way for seamless gaming or multitasking. It also comes with 64 GB of storage capacity which allows for easy storing of your media files. """),
  ProductModel("Samsung galaxyS20",74999,0,75999,"Asset/shoppingImages/Samsung galaxyS20.jpeg","""Samsung Galaxy S20 smartphone was launched on 11th February 2020. The phone comes with a 6.20-inch touchscreen display with a resolution of 1440x3200 pixels and an aspect ratio of 20:9. Samsung Galaxy S20 is powered by a 2GHz octa-core Samsung Exynos 990 processor that features 2 cores clocked at 2.73GHz, 2 cores clocked at 2.5GHz and 4 cores clocked at 2GHz. It comes with 8GB of RAM. The Samsung Galaxy S20 runs Android 10 and is powered by a 4000mAh non-removable battery. The Samsung Galaxy S20 supports wireless charging, as well as proprietary fast charging.The Samsung Galaxy S20 runs One UI 2.0 based on Android 10 and packs 128GB of inbuilt storage that can be expanded via microSD card (up to 1000GB). The Samsung Galaxy S20 is a dual-SIM (GSM and GSM) smartphone that accepts Nano-SIM and Nano-SIM cards. The Samsung Galaxy S20 measures 151.70 x 69.10 x 7.90mm (height x width x thickness) and weighs 163.00 grams. It was launched in Cloud Blue, Cloud Pink, Cosmic Grey, and colours. It features an IP68 rating for dust and water protection. It bears a glass body. """),




];
class Shopping_list_Mobile extends StatefulWidget {




  @override
  _Shopping_list_MobileState createState() => _Shopping_list_MobileState();
}

class _Shopping_list_MobileState extends State<Shopping_list_Mobile> {


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

        title: Text('Mobiles'),),
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

