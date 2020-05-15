import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/product_details.dart';
class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products_list=[
    {
      "name":"Airpods",
      "picture":"Asset/shoppingImages/Air pods.jpeg",
      "old_price":19955,
      "price":15955,
      "details":"""AirPods are Apple's completely wire-free headphones, which look a bit like the Apple EarPods from older devices, but without the cables. AirPods have Apple-designed tech inside like a special wireless chip called the W1 or H1 (depending on version), an accelerometer for gestures, dual optical sensors, dual beamforming microphones for Siri and phone calls, and a second accelerometer for speech detection. AirPods come with the AirPods Charging Case, which is used for both charging and storage purposes so the AirPods don't get lost. The Charging Case is about the size of a container of dental floss, so it's easily pocketable. A Lightning port at the bottom lets the AirPods and the case be charged with the Lightning cables you already have on hand, and the Wireless Charging Case lets you charge with a Qi wireless charger."""

    },

    {
      "name":"Iphone 11",
      "picture":"Asset/shoppingImages/Iphone 11.jpeg",
      "old_price":100000,
      "price":89999,
      "details":"""The iPhone 11, along with the iPhone 11 Pro, uses Apple's A13 Bionic processor, which contains a third-generation neural engine. It has three internal storage options: 64 GB, 128 GB, and 256GB. It also has 4 GB of RAM. The iPhone 11 has an IP68 water and dust-resistant rating along with dirt and grime, and is water-resistant up to two meters for 30 minutes. However, the manufacturer warranty does not cover liquid damage to the phone. Also, like previous iPhones, both phones do not have a headphone jack, and come with wired EarPods with a Lightning connector. The iPhone 11 is the first smartphone with built-in ultra-wideband hardware, via its Apple U1 chip. """

    },



  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products_list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder:(BuildContext context,int index){
          return Single_prod(
            prod_name: products_list[index]['name'],
            prod_picture: products_list[index]['picture'],
            prod_old_price: products_list[index]['old_price'],
            prod_price: products_list[index]['price'],
            prod_detail:products_list[index]['details']

          );
         });
  }
}
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;
  final prod_detail;
  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price,
    this.prod_detail


});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
        child: InkWell(onTap: ()=>
            Navigator.of(context).push(
                MaterialPageRoute(
                  //passing the product details from this product class to the product detail class
                    builder: (context)=> new ProductDetails(
                      product_detail_name: prod_name,
                      product_detail_new_price: prod_price,
                      product_detail_old_price: prod_old_price,
                      product_detail_picture: prod_picture,
                      product_detail_detail: prod_detail,
                    ))),
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(prod_name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                title: Text("Rs$prod_price",
                  style: TextStyle(color: Colors.red),),
                subtitle:  Text("Rs$prod_old_price",
                  style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w800,
                      decoration:
                      TextDecoration.lineThrough ),),

              ),
            ),
            child:Image.asset(prod_picture,
            fit: BoxFit.cover),),
        )
            ,)
      ),
    );
  }
}
