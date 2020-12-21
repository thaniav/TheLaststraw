import 'package:flutter/material.dart';
import 'package:palet/Pages/shopping/Shopping_list_new_Mobile.dart';
import 'package:palet/Pages/shopping/Shopping_list_new_accessories.dart';
class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[



          Category(
            image_location: 'Asset/shoppingImages/Headphone.jpg',
            image_caption: 'Accessories',
            location:new Shopping_list_accessories(),
          ),
          Category(
            image_location: 'Asset/shoppingImages/Mobile.jpg',
            image_caption: 'Mobile Phones',
            location: new Shopping_list_Mobile(),
          ),

        ],

      ),
    );
  }
}
class Category extends StatelessWidget {
  final String image_location;
  final String image_caption;
  final location;
  Category({this.image_location,this.image_caption,this.location});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(onTap: (){

      },
      child: Container(
        width: 100.0,
        child: ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>location));
          },
          title: Image.asset(image_location,width: 100.0,height: 80.0 ,),
          subtitle: Container(
            alignment: Alignment.topCenter,
            child: Text(image_caption, style: TextStyle(fontSize: 12.0),),
          )

        ),
      ),
      ),
    );
  }
}

