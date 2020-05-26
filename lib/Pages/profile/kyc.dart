
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:palet/models/uid.dart';
import 'package:palet/services/database.dart';
import 'package:palet/shared/constants.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
class KYC extends StatefulWidget {
  @override
  _KYCState createState() => _KYCState();
}


class _KYCState extends State<KYC> {
  File imagefile;
  int flag=0;
  void _opengallery(BuildContext context) async {
      var picture=(await ImagePicker.pickImage(source: ImageSource.gallery)) ;
      this.setState((){
        imagefile=picture;
      });
      Navigator.of(context).pop();
  }
  void _opencamera(BuildContext context) async{
    var picture=(await ImagePicker.pickImage(source: ImageSource.camera));
    this.setState((){
    imagefile=picture;
    });
    Navigator.of(context).pop();
  }
  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,builder:(BuildContext context){
      return AlertDialog(
        title: Text('Make a choice'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text('gallery'),
                onTap: (){
                  _opengallery(context);
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              GestureDetector(
                child: Text('camera'),
                onTap: (){
                  _opencamera(context);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
  Widget _designimageview(){
    if(imagefile==null&&flag==0){
      return Text('upload adhaar card');
    }
    if(flag==1){
      return Text('adhaar card is uploaded');
    }
    if(imagefile!=null){
      flag=1;
      return Image.file(imagefile,width: 400.0,height: 400.0,);
    }
  }
  Future uploadpic(BuildContext context) async{
    String filename=basename(imagefile.path);
    StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child('profiles/$current_user_uid');
    StorageUploadTask uploadTask=firebaseStorageRef.putFile(imagefile);
   await uploadTask.onComplete;
    firebaseStorageRef.getDownloadURL().then((fileURL) {
      uploadedFileURL = fileURL;
      print("File url : $uploadedFileURL");
      DatabaseService(uid: current_user_uid).updateProfile(uploadedFileURL);


    });

    setState(() {
      print("image uploaded!");
      Scaffold.of(context).showSnackBar(SnackBar(content:Text('picture Uploaded')));
    });
    
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('KYC'),
        elevation: 0.0,
      ),
      body:Builder(builder: (context)=>Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _designimageview(),
          Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                        child: new RaisedButton(
                          child: new Text("Select"),
                          textColor: Colors.white,
                          color: kSecondaryColor,
                          onPressed: () async {

                            _showChoiceDialog(context);
                          },
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                        )),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Container(
                        child: new RaisedButton(
                          child: new Text("Upload"),
                          textColor: Colors.white,
                          color: Colors.blue,
                          onPressed: (){
                            uploadpic(context);
                          },

                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                        )),
                  ),
                  flex: 2,
                ),
              ],
            ),
          ),

             
             
            ],
          ),
        ),
      ),)
    
    );
  }
}

